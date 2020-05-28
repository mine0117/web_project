package com.ssafy.hrm.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.ssafy.hrm.dto.EmployeeDto;



public interface ISSAFYDao {
	public List<EmployeeDto> findAllEmployees() throws Exception;
	public EmployeeDto findEmployeeById(int id) throws Exception;
	int findAfterAdd() throws Exception;
	
	public void addEmployee(EmployeeDto emp) throws Exception;
	public boolean updateEmployee(EmployeeDto emp) throws Exception;
	public boolean deleteEmployee(int id) throws Exception;


	
}
