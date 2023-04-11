package com.kh.onthetrain.scheduler.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.fail;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.onthetrain.scheduler.model.entity.Scheduler;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
		"file:src/main/webapp/WEB-INF/spring/root-context.xml" })
class SchedulerServiceimplTest {

	@Autowired
	private SchedulerService service;

	@Test
	@Disabled
	void test() {
		fail("Not yet implemented");
	}

	@Test
	void findSchedulerByNo() {
		int no = 1;
		Scheduler findSchedulerByNo = service.findSchedulerByNo(no);
		System.out.println(findSchedulerByNo);
		assertThat(findSchedulerByNo).isNotNull();
	}
}