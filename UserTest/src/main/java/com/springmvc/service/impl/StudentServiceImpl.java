package com.springmvc.service.impl;

import com.springmvc.dao.StudentMapper;
import com.springmvc.entity.Student;
import com.springmvc.service.interf.IStudentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @Author: ydh
 * @Date: 2018/11/12 18:18
 * @Version: 1.0
 * @todo
 */
@Service("stuService")
public class StudentServiceImpl implements IStudentService {
    @Resource
    StudentMapper studentMapper;

    @Override
    public Student getStudentInfo(String stuNumber) {

        return studentMapper.selectByPrimaryKey(stuNumber);
    }
}
