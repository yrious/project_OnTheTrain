package com.kh.onthetrain.trainTable.model.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class TrainBook {

	private int bookNo;
	
	private int ticketNo;
	
	private int peopleNo;
	
	private String status;
	
	private Date bookDate;
	
	private String room;
	
	private String seat;
}
