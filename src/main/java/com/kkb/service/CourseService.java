package com.kkb.service;

import com.kkb.dao.CourseMapper;
import com.kkb.pojo.Course;
import com.kkb.pojo.CourseExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseService {

    @Autowired
    public CourseMapper courseMapper;

    public List<Course> getCousers() {
        CourseExample courseExample = new CourseExample();
        CourseExample.Criteria criteria = courseExample.createCriteria();
        criteria.andIdIsNotNull();
        return courseMapper.selectByExample(courseExample);
    }


    public boolean updateCourse(Course course) {
        int i = courseMapper.updateByPrimaryKey(course);
        if (i > 0){
            return true;
        }
        return false;
    }
}
