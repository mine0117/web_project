package com.ssafy.hrm.service;

import java.util.List;

import com.ssafy.hrm.dto.EmployeeDto;


public interface EmployeeService {
	public List<EmployeeDto> findAllEmployees() throws Exception;
	public EmployeeDto findEmployeeById(int id) throws Exception;
	
	public int addEmployee(EmployeeDto emp) throws Exception;
	public boolean updateEmployee(EmployeeDto emp) throws Exception;
	public boolean deleteEmployee(int id) throws Exception;

}
