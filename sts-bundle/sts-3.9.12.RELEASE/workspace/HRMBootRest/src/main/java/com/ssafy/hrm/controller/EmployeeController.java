package com.ssafy.hrm.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.hrm.dto.EmployeeDto;
import com.ssafy.hrm.help.BoolResult;
import com.ssafy.hrm.help.NumberResult;
import com.ssafy.hrm.service.EmployeeService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
//http://localhost:8097/hrmboot/swagger-ui.html

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@RequestMapping("/api")
@Api(value = "SSAFY")
public class EmployeeController {

	public static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);

	@Autowired
	private EmployeeService employeeService;

	@ApiOperation(value = "모든 사원의 정보를 반환한다.", response = List.class)
	@RequestMapping(value = "/employee/all", method = RequestMethod.GET)
	public ResponseEntity<List<EmployeeDto>> findAllEmployees() throws Exception {
		logger.info("1-------------findAllEmployees-----------------------------" + new Date());
		List<EmployeeDto> emps = employeeService.findAllEmployees();
		if (emps.isEmpty()) {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<EmployeeDto>>(emps, HttpStatus.OK);
	}

	@ApiOperation(value = " 새로운 사원을 정보를 입력한다. 그리고 그 사원의 사원번호를 반환한다.", response = NumberResult.class)
	@RequestMapping(value = "/employee", method = RequestMethod.POST)
	public ResponseEntity<NumberResult> addEmployee(@RequestBody EmployeeDto dto) throws Exception {
		logger.info("5-------------addEmployee-----------------------------" + new Date());
		logger.info("5-------------addEmployee-----------------------------" + dto);
		int total = employeeService.addEmployee(dto);
		NumberResult nr = new NumberResult();
		nr.setCount(total);
		nr.setName("addEmployee");
		nr.setState("succ");
		logger.info("5-------------addEmployee-------id------------------" + total);
		if (total <= 0) {
			nr.setCount(-1);
			nr.setName("addEmployee");
			nr.setState("fail");
			// return new ResponseEntity(HttpStatus.NO_CONTENT);
			return new ResponseEntity<NumberResult>(nr, HttpStatus.OK);
		}
		return new ResponseEntity<NumberResult>(nr, HttpStatus.OK);
	}

	@ApiOperation(value = "사원아이디로 사원의 정보를 찾는다.", response = EmployeeDto.class)
	@RequestMapping(value = "/employee/{id}", method = RequestMethod.GET)
	public ResponseEntity<EmployeeDto> findEmployeeById(@PathVariable int id) throws Exception {
		logger.info("1-------------findEmployeeById-----------------------------" + new Date());
		EmployeeDto emp = employeeService.findEmployeeById(id);
		if (emp == null || emp.getId() == 0) {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<EmployeeDto>(emp, HttpStatus.OK);
	}

	@ApiOperation(value = " 사원의 정보를 수정한다 만약 사원의 부서와 업무가 변경되면 잡히스토리에  자동(trigger)으로 추가된다. 원래 put이다.", response = BoolResult.class)
	@RequestMapping(value = "/employee", method = RequestMethod.PUT)
	public ResponseEntity<BoolResult> updateEmployee(@RequestBody EmployeeDto dto) throws Exception {
		logger.info("1-------------updateEmployee-----------------------------" + new Date());
		logger.info("1-------------updateEmployee-----------------------------" + dto);
		boolean total = employeeService.updateEmployee(dto);
		BoolResult nr = new BoolResult();
		nr.setCount(total);
		nr.setName("updateEmployee");
		nr.setState("succ");
		if (!total) {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<BoolResult>(nr, HttpStatus.OK);
	}

	@ApiOperation(value = " 해당사원의 정보를 삭제한다. 사원의 정보를 삭제하기전, 정산하고 , 잡히스토리 수정등 여러 작업을 해야한다. 여기서는 히스토리를 모두 지우고(수정한 적이 없다면 바로 삭제가능) 삭제할 수 있다 . 원래 delete다", response = BoolResult.class)
	@RequestMapping(value = "/employee/{employeeId}", method = RequestMethod.DELETE)
	public ResponseEntity<BoolResult> deleteEmployee(@PathVariable int employeeId) throws Exception {
		logger.info("1-------------deleteEmployee-----------------------------" + new Date());
		logger.info("1-------------deleteEmployee-----------------------------" + employeeId);

		boolean total = employeeService.deleteEmployee(employeeId);
		BoolResult nr = new BoolResult();
		nr.setCount(total);
		nr.setName("deleteEmployee");
		nr.setState("succ");
		if (!total) {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<BoolResult>(nr, HttpStatus.OK);
	}

}
