/**
 * <pre>
 * Copyright:		Copyright(C) 2012-2013, node.com
 * Filename:		com.node.sample.service.TaskService.java
 * Class:			TaskService
 * Date:			2013-4-21
 * Author:			<a href="mailto:node@gmail.com">node</a>
 * Version          2.0.0
 * Description:		
 *
 * </pre>
 **/
 
package com.node.eduoa.service;

import com.node.eduoa.entity.OaClass;
import com.node.eduoa.entity.OaLeavePermit;
import com.node.eduoa.entity.OaScore;
import com.node.system.util.dwz.Page;

import java.util.List;
import java.util.Map;

import org.springframework.data.repository.query.Param;

/** 
 * 	
 * @author 	<a href="mailto:node@gmail.com">node</a>
 * Version  2.0.0
 * @since   2013-4-21 下午7:55:07 
 */

public interface GradeQueryService {
	
//	public List<OaScore> findScoreByParameter(Float score1, Float score2, int examType);
//	
//	public List<OaScore> findScoreByParameterAll(Long grade,Long classId, Long subject,Float score1, Float score2, int examType);
	
	List<OaScore> findSearchParameter(Map<String, Object> searchParams);
	
}
