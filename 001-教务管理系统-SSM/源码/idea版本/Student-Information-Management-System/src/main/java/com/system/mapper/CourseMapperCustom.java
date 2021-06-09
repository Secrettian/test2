package com.system.mapper;

import com.system.po.CourseCustom;
import com.system.po.PagingVO;

import java.util.List;

/**
 * 课程类控制器
 */
public interface CourseMapperCustom {

    //分页查询学生信息
    List<CourseCustom> findByPaging(PagingVO pagingVO) throws Exception;

}
