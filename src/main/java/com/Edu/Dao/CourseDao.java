package com.Edu.Dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Edu.Domain.Course;

public interface CourseDao extends JpaRepository<Course, Integer> {

}
