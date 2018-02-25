package com.Edu.Dao;

import java.util.List;


import com.Edu.Domain.Course;
import com.Edu.Domain.Lecture;


public interface CourseMapper {

	Course findcos(int cosno);

	List<Lecture> findcos_lec(int cosno);
}
