package com.kh.onthetrain.trainTable.model.mapper;

import org.apache.ibatis.annotations.Param;

import com.kh.onthetrain.trainTable.model.entity.TrainTicket;

public interface trainTableMapper {
	
	TrainTicket selectTrainTableByNo(@Param("ticketNo") int ticketNo);
}