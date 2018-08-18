package com.yue.service;

import com.yue.domain.LeaveBill;
import org.activiti.bpmn.model.SequenceFlow;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.task.Comment;
import org.activiti.engine.task.Task;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

/**
 * Created by YueFeng on 2018-08-09
 */
@Service
public interface WorkflowService {
    List<Deployment> findDeploymentList();

    List<ProcessDefinition> findProcessDefinitionList();

    void saveNewDeploye(MultipartFile file, String filename);

    InputStream findImageInputStream(String deploymentId, String imageName);

    void deleteProcessDefinitionByDeploymentId(String deploymentId);

    void savestartProcess(Long id,String userName);

    List<Task> findTaskListByName(String name);

    String findTaskFormKeyByTaskId(String taskId);

    LeaveBill findLeaveBillByTaskId(String taskId);

    List<String> findOutComeListByTaskId(String taskId);

    List<Comment> findCommentByTaskId(String taskId);

    void saveSubmitTask(Long id, String taskId, String comment,String outcome);

    ProcessDefinition findProcessDefinitionByTaskId(String taskId);

    Map<String,Object> findCoordingByTask(String taskId);

    List<Comment> findCommentByLeaveBillId(Long id);
}
