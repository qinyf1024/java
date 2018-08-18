package com.yue.controller;

import com.yue.domain.LeaveBill;
import com.yue.domain.WorkflowBean;
import com.yue.service.LeaveBillService;
import com.yue.service.WorkflowService;
import org.activiti.bpmn.model.SequenceFlow;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.task.Comment;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

/**
 * Created by YueFeng on 2018-08-09
 */
@Controller
public class WorkflowController extends BaseController{

    @Autowired
    private WorkflowService workflowService;

    @Autowired
    private LeaveBillService leaveBillService;

    /**
     * 部署管理首页显示
     *
     * @return
     */
    @RequestMapping("/deployHome")
    public String deployHome(Model model) {
        //1:查询部署对象信息，对应表（act_re_deployment）
        List<Deployment> depList = workflowService.findDeploymentList();
        //2:查询流程定义的信息，对应表（act_re_procdef）
        List<ProcessDefinition> pdList = workflowService.findProcessDefinitionList();
        //放置到model对象中
        model.addAttribute("depList", depList);
        model.addAttribute("pdList", pdList);
        return "/workflow/workflow";
    }

    /**
     * 发布流程
     */
    @RequestMapping("/newdeploy")
    public String newdeploy(@RequestParam("filename") String filename, @RequestParam("file") MultipartFile file) {
        //完成部署
        workflowService.saveNewDeploye(file, filename);
        return "redirect:/deployHome";
    }

    /**
     * 删除部署信息
     */
    @RequestMapping("/delDeployment")
    public String delDeployment(@RequestParam("deploymentId") String deploymentId){

        //1：使用部署对象ID，删除流程定义
        workflowService.deleteProcessDefinitionByDeploymentId(deploymentId);
        return "redirect:/deployHome";
    }

    /**
     * 查看流程图
     */
    @RequestMapping("/viewImage")
    public void viewImage(@RequestParam("deploymentId") String deploymentId,
                          @RequestParam("imageName") String imageName,
                          HttpServletResponse response) throws IOException {
        //1：获取资源文件表（act_ge_bytearray）中资源图片输入流InputStream
        InputStream in = workflowService.findImageInputStream(deploymentId, imageName);

        //response.setHeader("Content-type","text/html;charset=UTF-8");
        response.setHeader(null,null);
        OutputStream out = response.getOutputStream();
        //2：将输入流中的数据读取出来，写到输出流中
        for (int b = -1; (b = in.read()) != -1; ) {
            out.write(b);
        }
        out.close();
        in.close();
    }

    @RequestMapping("/test")
    public void test(HttpServletResponse response) throws IOException {
        String str = "使用OutputStream输出中文：我心自在";
        //在服务器设置响应头，告诉浏览器以utf-8的编码显示数据，如果不写会出现中文乱码
        response.setHeader("content-type", "text/html;charset=UTF-8");
        //获取OutputStream输出流
        OutputStream os = response.getOutputStream();
        /**
         * getBytes的作用是将字符转化为字节数组，如果不带参数，默认根据系统环境来进行转化
         * 这里指定以utf-8的编码进行转换
         */
        byte[] b = str.getBytes("utf-8");
        //想客户端（浏览器）输出数据
        System.out.println(b);
        os.write(b);
    }

    /**
     * 启动流程
     */
    @RequestMapping("/startProcess")
    public String startProcess(@RequestParam("id") Long id){
        //获取当前任务的办理人，使用流程变量设置下一个任务的办理人
        String userName = getUserName();
        //更新请假状态，启动流程实例，让启动的流程实例关联业务
        workflowService.savestartProcess(id,userName);
        return "redirect:/task";
    }

    /**
     * 任务管理首页显示
     */
    @RequestMapping("/task")
    public String task(Model model) {
        //获取当前用户名
        String name = getUserName();
        //2：使用当前用户名查询正在执行的任务表，获取当前任务的集合List<Task>
        List<Task> list = workflowService.findTaskListByName(name);
        model.addAttribute("list", list);
        return "/workflow/task";
    }

    /**
     * 打开任务表单
     */
    @RequestMapping("/viewTaskForm")
    public String viewTaskForm(@RequestParam("taskId") String taskId){
        //获取任务表单中任务节点的url连接
        String url = workflowService.findTaskFormKeyByTaskId(taskId);
        url += "?taskId="+taskId;
        return "redirect:"+url;
    }

    // 准备表单数据
    @RequestMapping("/audit")
    public String audit(@RequestParam("taskId") String taskId,Model model){
        model.addAttribute("taskId",taskId);
        //获取任务ID
        /**一：使用任务ID，查找请假单ID，从而获取请假单信息*/
        LeaveBill leaveBill = workflowService.findLeaveBillByTaskId(taskId);
        model.addAttribute("leaveBill",leaveBill);
        /**二：已知任务ID，获取当前任务完成之后的连线名称，并放置到List<SequenceFlow>集合中*/
        List<String> outcomeList = workflowService.findOutComeListByTaskId(taskId);
        model.addAttribute("outcomeList", outcomeList);
        /**三：查询所有历史审核人的审核信息，帮助当前人完成审核，返回List<Comment>*/
        List<Comment> commentList = workflowService.findCommentByTaskId(taskId);
        model.addAttribute("commentList", commentList);
        return "/workflow/taskForm";
    }
    /**
     * 提交任务
     */
    @RequestMapping("/submitTask")
    public String submitTask(@RequestParam("id") Long id,
                             @RequestParam("taskId") String taskId,
                             @RequestParam("comment") String comment,
                             @RequestParam("outcome") String outcome){
        workflowService.saveSubmitTask(id,taskId,comment,outcome);
        return "/workflow/taskForm";
    }

    /**
     * 查看当前流程图（查看当前活动节点，并用红色的框标注）
     */
    @RequestMapping("/viewCurrentImage")
    public String viewCurrentImage(@RequestParam("taskId") String taskId,Model model){
        /**一：查看流程图*/
        //1：获取任务ID，获取任务对象，使用任务对象获取流程定义ID，查询流程定义对象
        ProcessDefinition pd = workflowService.findProcessDefinitionByTaskId(taskId);
        //workflowAction_viewImage?deploymentId=<s:property value='#deploymentId'/>&imageName=<s:property value='#imageName'/>
        model.addAttribute("deploymentId", pd.getDeploymentId());
        model.addAttribute("imageName", pd.getDiagramResourceName());
        /**二：查看当前活动，获取当期活动对应的坐标x,y,width,height，将4个值存放到Map<String,Object>中*/
        Map<String, Object> map = workflowService.findCoordingByTask(taskId);
        model.addAttribute("acs", map);
        return "/workflow/image";
    }

    // 查看历史的批注信息
    @RequestMapping("/viewHisComment")
    public String viewHisComment(@RequestParam("id") Long id,Model model){
        //1：使用请假单ID，查询请假单对象，将对象放置到栈顶，支持表单回显
        LeaveBill leaveBill = leaveBillService.findOne(id);
        model.addAttribute("leaveBill",leaveBill);
        //2：使用请假单ID，查询历史的批注信息
        List<Comment> commentList = workflowService.findCommentByLeaveBillId(id);
        model.addAttribute("commentList", commentList);
        return "/workflow/taskFormHis";
    }
}
