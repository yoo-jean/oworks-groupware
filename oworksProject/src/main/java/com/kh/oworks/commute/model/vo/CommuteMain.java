package com.kh.oworks.commute.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CommuteMain {
	
	private int empNo;				// 사원번호
	private String empId;			// 사원아이디
	private int workStatusLate;		// 지각횟수
	private int workStatusEarly;	// 조퇴횟수
	private int workStatusOff;		// 결근휴가횟수
	private int workStatusOn;		// 정출횟수
	private String workStatusSum;	// 총근무시간
	private String workTimeAvg;		// 평균근무시간
	private String selectStartTime;	// 출근시간
	private String selectEndTime;	// 퇴근시간
	
}
