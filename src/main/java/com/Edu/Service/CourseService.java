package com.Edu.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.Edu.Domain.Course;
import com.Edu.Domain.Lecture;

@Service
public interface CourseService {
	public Course findcos(int cosno);
	
	public List<Lecture> findcos_lec(int cosno);
}
