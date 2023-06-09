package com.kh.onthetrain.accommodation.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Review {
	
//	private String nickname;
	private int no;
	private int memberNo;
	private String nickname;
	private int accommodationNo;
	private String content;
	private int starPoint;
	private Date createDate;
	private Date modifyDate;
}
