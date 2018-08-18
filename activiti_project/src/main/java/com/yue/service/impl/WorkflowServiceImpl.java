package com.yue.service.impl;

import com.yue.dao.LeaveBillDao;
import com.yue.domain.LeaveBill;
import com.yue.service.WorkflowService;
import org.activiti.bpmn.model.BpmnModel;
import org.activiti.engine.*;
import org.activiti.engine.form.TaskFormData;
import org.activiti.engine.history.HistoricVariableInstance;
import org.activiti.engine.impl.identity.Authentication;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.impl.pvm.PvmTransition;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Comment;
import org.activiti.engine.task.Task;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipInputStream;

/**
 * Created by YueFeng on 2018-08-09
 */
@Service
public class WorkflowServiceImpl implements WorkflowService {
    /**
     * 请假申请Dao
     */
    @Autowired
    private LeaveBillDao leaveBillDao;
    @Autowired
    private RepositoryService repositoryService;
    @Autowired
    private RuntimeService runtimeService;
    @Autowired
    private TaskService taskService;
    @Autowired
    private FormService formService;
    @Autowired
    private HistoryService historyService;

    /**查询部署对象信息，对应表（act_re_deployment）*/
    @Override
    public List<Deployment> findDeploymentList() {
        List<Deployment> list = repositoryService.createDeploymentQuery()//创建部署对象查询
                .orderByDeploymenTime().asc()//
                .list();
        return list;
    }

    /**查询流程定义的信息，对应表（act_re_procdef）*/
    @Override
    public List<ProcessDefinition> findProcessDefinitionList() {
        List<ProcessDefinition> list = repositoryService.createProcessDefinitionQuery()//创建流程定义查询
                .orderByProcessDefinitionVersion().asc()//
                .list();
        return list;
    }

    /**部署流程定义*/
    @Override
    public void saveNewDeploye(MultipartFile file, String filename){
        String message = "";
        String filename1 = file.getOriginalFilename();
        try {
            InputStream fileInputStream = file.getInputStream();
            Deployment deployment = null;
            String extension = FilenameUtils.getExtension(filename1);
            if (extension.equals("zip") || extension.equals("bar")) {
                ZipInputStream zip = new ZipInputStream(fileInputStream);
                deployment = repositoryService.createDeployment()
                        .name(filename)//添加部署名称
                        .addZipInputStream(zip)
                        .deploy();//完成部署
            } else {
                message = "不支持的文件类型：" + extension;
            }

            List<ProcessDefinition> list = repositoryService.createProcessDefinitionQuery().deploymentId(deployment.getId()).list();

            // 设置流程分类
            for (ProcessDefinition processDefinition : list) {
                repositoryService.setProcessDefinitionCategory(processDefinition.getId(), filename1);
                message += "部署成功，流程ID=" + processDefinition.getId() + "<br/>";
            }
            if (list.size() == 0) {
                message = "部署失败，没有流程。";
            } }
            catch (Exception e) {
            throw new ActivitiException("部署失败！", e);
        }
    }

    /**使用部署对象ID和资源图片名称，获取图片的输入流*/
    @Override
    public InputStream findImageInputStream(String deploymentId, String imageName) {
        return repositoryService.getResourceAsStream(deploymentId, imageName);
    }

    /**使用部署对象ID，删除流程定义*/
    @Override
    public void deleteProcessDefinitionByDeploymentId(String deploymentId) {
        repositoryService.deleteDeployment(deploymentId, true);
    }

    /**
     * 更新请假状态，启动流程实例，让启动的流程实例关联业务
     */
    @Override
    public void savestartProcess(Long id,String userName) {
        //1：更新请假单的请假状态从0变成1（初始录入-->审核中）
        leaveBillDao.updateState(id);
        //2：使用当前对象获取到流程定义的key（对象的名称就是流程定义的key）
        String key = LeaveBill.class.getSimpleName();
        /**
         * 获取当前任务的办理人，使用流程变量设置下一个任务的办理人
         * inputUser是流程变量的名称，
         * 获取的办理人是流程变量的值
         */
        HashMap<String, Object> variables = new HashMap<>();
        variables.put("inputUser",userName);
        /**
         * (1)使用流程变量设置字符串（格式：LeaveBill.id的形式），通过设置，让启动的流程（流程实例）关联业务
         * (2)使用正在执行对象表中的一个字段BUSINESS_KEY（Activiti提供的一个字段），让启动的流程（流程实例）关联业务
         */
        //格式：LeaveBill.id的形式（使用流程变量）
        String objId = key+"."+id;
        variables.put("objId",objId);
        //使用流程定义的key，启动流程实例，同时设置流程变量，同时向正在执行的执行对象表中的字段BUSINESS_KEY添加业务数据，同时让流程关联业务
        runtimeService.startProcessInstanceByKey(key,objId,variables);
    }
    /**使用当前用户名查询正在执行的任务表，获取当前任务的集合List<Task>*/
    @Override
    public List<Task> findTaskListByName(String name) {
        List<Task> list = taskService.createTaskQuery()//
                .taskAssignee(name)//指定个人任务查询
                .orderByTaskCreateTime().asc()//
                .list();
        return list;
    }

    /**使用任务ID，获取当前任务节点中对应的Form key中的连接的值*/
    @Override
    public String findTaskFormKeyByTaskId(String taskId) {
        TaskFormData formData = formService.getTaskFormData(taskId);
        //获取Form key的值
        String url = formData.getFormKey();
        return url;
    }

    /**
     *一：使用任务ID，查找请假单ID，从而获取请假单信息
     */
    @Override
    public LeaveBill findLeaveBillByTaskId(String taskId) {
        //1:使用任务ID，查询任务对象Task
        Task task = taskService.createTaskQuery()
                .taskId(taskId)//使用任务ID查询
                .singleResult();
        //2:使用任务对象Task获取流程实例ID
        String processInstanceId = task.getProcessInstanceId();
        //3:使用流程实例ID，查询正在执行的执行对象表，返回实例流程对象
        ProcessInstance pi = runtimeService.createProcessInstanceQuery()
                .processInstanceId(processInstanceId)
                .singleResult();
        //4:使用流程实例对象获取BUSINESS_KEY
        String businessKey = pi.getBusinessKey();
        //5:获取BUSINESS_KEY对应的主键ID，使用主键ID，查询请假单对象(LeaveBill.1)
        String id = "";
        if (StringUtils.isNotBlank(businessKey)){
            id=businessKey.split("\\.")[1];
        }
        //查询请假单对象
        LeaveBill leaveBill = leaveBillDao.findOne(Long.parseLong(id));
        return leaveBill;
    }

    /**
     *二：已知任务ID，获取当前任务完成之后的连线名称，并放置到List<SequenceFlow>集合中
     */
    @Override
    public List<String> findOutComeListByTaskId(String taskId) {
        //返回存放连线的名称集合
        ArrayList<String> list = new ArrayList<>();
        //1:使用任务ID，查询任务对象Task
        Task task = taskService.createTaskQuery()
                .taskId(taskId)//使用任务ID查询
                .singleResult();
        //2：获取流程定义ID
        String processDefinitionId = task.getProcessDefinitionId();

        BpmnModel bpmnModel = repositoryService.getBpmnModel(processDefinitionId);

        //3:查询ProcessDefinitionEntiy对象
        ProcessDefinitionEntity processDefinitionEntity = (ProcessDefinitionEntity) repositoryService.getProcessDefinition(processDefinitionId);
        //使用任务对象Task获取流程实例ID
        String processInstanceId = task.getProcessInstanceId();
        ProcessInstance pi = runtimeService.createProcessInstanceQuery()
                .processInstanceId(processInstanceId)
                .singleResult();

        //获取当前获得的ID
        String activityId = pi.getActivityId();
        //4：获取当前的活动
        ActivityImpl activityImpl = processDefinitionEntity.findActivity(activityId);
        //5：获取当前活动完成之后连线的名称
        List<PvmTransition> pvmList = activityImpl.getOutgoingTransitions();
        if(pvmList!=null && pvmList.size()>0){
            for(PvmTransition pvm:pvmList){
                String name = (String) pvm.getProperty("name");
                if(StringUtils.isNotBlank(name)){
                    list.add(name);
                }
                else{
                    list.add("默认提交");
                }
            }
        }
        return list;
    }
    /**获取批注信息，传递的是当前任务ID，获取历史任务ID对应的批注*/
    @Override
    public List<Comment> findCommentByTaskId(String taskId) {
        //使用当前的任务ID，查询当前流程对应的历史任务ID
        //使用当前任务ID，获取当前任务对象
        Task task = taskService.createTaskQuery()//
                .taskId(taskId)//使用任务ID查询
                .singleResult();
        //获取流程实例ID
        String processInstanceId = task.getProcessInstanceId();
        //获取任务批注
        List<Comment> list = taskService.getProcessInstanceComments(processInstanceId);
        return list;
    }

    @Override
    public void saveSubmitTask(Long id, String taskId, String comment,String outcome) {
        /**
         * 1：在完成之前，添加一个批注信息，向act_hi_comment表中添加数据，用于记录对当前申请人的一些审核信息
         */
        //使用任务ID，查询任务对象，获取流程流程实例ID
        Task task = taskService.createTaskQuery()//
                .taskId(taskId)//使用任务ID查询
                .singleResult();
        //获取流程实例ID
        String processInstanceId = task.getProcessInstanceId();
        /**
         * 注意：添加批注的时候，由于Activiti底层代码是使用：
         * 		String userId = Authentication.getAuthenticatedUserId();
         CommentEntity comment = new CommentEntity();
         comment.setUserId(userId);
         所有需要从Session中获取当前登录人，作为该任务的办理人（审核人），对应act_hi_comment表中的User_ID的字段，不过不添加审核人，该字段为null
         所以要求，添加配置执行使用Authentication.setAuthenticatedUserId();添加当前任务的审核人
         * */
        Authentication.setAuthenticatedUserId(SecurityContextHolder.getContext().getAuthentication().getName());
        taskService.addComment(taskId, processInstanceId, comment);
        /**
         * 2：如果连线的名称是“默认提交”，那么就不需要设置，如果不是，就需要设置流程变量
         * 在完成任务之前，设置流程变量，按照连线的名称，去完成任务
         流程变量的名称：outcome
         流程变量的值：连线的名称
         */
        Map<String, Object> variables = new HashMap<String,Object>();
        if(outcome!=null && !outcome.equals("默认提交")){
            variables.put("outcome", outcome);
        }

        //3：使用任务ID，完成当前人的个人任务，同时流程变量
        taskService.complete(taskId, variables);
        //4：当任务完成之后，需要指定下一个任务的办理人（使用类）-----已经开发完成

        /**
         * 5：在完成任务之后，判断流程是否结束
         如果流程结束了，更新请假单表的状态从1变成2（审核中-->审核完成）
         */
        ProcessInstance pi = runtimeService.createProcessInstanceQuery()//
                .processInstanceId(processInstanceId)//使用流程实例ID查询
                .singleResult();
        //流程结束了
        if(pi==null){
            //更新请假单表的状态从1变成2（审核中-->审核完成）
            leaveBillDao.updateState2(id);
        }
    }

    /**1：获取任务ID，获取任务对象，使用任务对象获取流程定义ID，查询流程定义对象*/
    @Override
    public ProcessDefinition findProcessDefinitionByTaskId(String taskId) {
        //使用任务ID，查询任务对象
        Task task = taskService.createTaskQuery()//
                .taskId(taskId)//使用任务ID查询
                .singleResult();
        //获取流程定义ID
        String processDefinitionId = task.getProcessDefinitionId();
        //查询流程定义的对象
        ProcessDefinition pd = repositoryService.createProcessDefinitionQuery()//创建流程定义查询对象，对应表act_re_procdef
                .processDefinitionId(processDefinitionId)//使用流程定义ID查询
                .singleResult();
        return pd;
    }
    /**
     * 二：查看当前活动，获取当期活动对应的坐标x,y,width,height，将4个值存放到Map<String,Object>中
     * map集合的key：表示坐标x,y,width,height
     * map集合的value：表示坐标对应的值
     */
    @Override
    public Map<String, Object> findCoordingByTask(String taskId) {
        //存放坐标
        Map<String,Object> map = new HashMap<>();
        //使用任务ID查询任务对象
        Task task = taskService.createTaskQuery()
                .taskId(taskId)
                .singleResult();
        //获取流程定义的ID
        String processDefinitionId = task.getProcessDefinitionId();
        //获取流程定义的实体对象(对应.bpmn文件的数据)
        ProcessDefinitionEntity processDefinitionEntity = (ProcessDefinitionEntity) repositoryService.getProcessDefinition(processDefinitionId);
        //获取流程实例ID
        String processInstanceId = task.getProcessInstanceId();
        //使用实例流程ID，查询正在执行的执行对象表，获取当前活动对应的流程实例对象
        ProcessInstance pi = runtimeService.createProcessInstanceQuery()//创建流程实例ID查询
                .processInstanceId(processInstanceId)
                .singleResult();
        //获取当前的活动的ID
        String activityId = pi.getActivityId();
        //获取当前活动对象
        ActivityImpl activity = processDefinitionEntity.findActivity(activityId);
        map.put("x",activity.getX());
        map.put("y",activity.getY());
        map.put("width",activity.getWidth());
        map.put("height",activity.getHeight());
        return map;
    }

    /**使用请假单ID，查询历史批注信息*/
    @Override
    public List<Comment> findCommentByLeaveBillId(Long id) {
        //获取对象的名称
        String objectName = LeaveBill.class.getSimpleName();
        //组织流程表中的字段中的值
        String objId = objectName+"."+id;

        /**1:使用历史的流程实例查询，返回历史的流程实例对象，获取流程实例ID*/
//		HistoricProcessInstance hpi = historyService.createHistoricProcessInstanceQuery()//对应历史的流程实例表
//						.processInstanceBusinessKey(objId)//使用BusinessKey字段查询
//						.singleResult();
//		//流程实例ID
//		String processInstanceId = hpi.getId();
        /**2:使用历史的流程变量查询，返回历史的流程变量的对象，获取流程实例ID*/
        HistoricVariableInstance hvi = historyService.createHistoricVariableInstanceQuery()//对应历史的流程变量表
                .variableValueEquals("objId", objId)//使用流程变量的名称和流程变量的值查询
                .singleResult();
        //流程实例ID
        String processInstanceId = hvi.getProcessInstanceId();
        List<Comment> list = taskService.getProcessInstanceComments(processInstanceId);
        return list;
    }
}
