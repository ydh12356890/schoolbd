package com.springmvc.service.interf;

import com.springmvc.entity.Student;

/**
 * @Author: ydh
 * @Date: 2018/11/12 18:17
 * @Version: 1.0
 * @todo
 */
public interface IStudentService {
    Student getStudentInfo(String stunumber);
}
