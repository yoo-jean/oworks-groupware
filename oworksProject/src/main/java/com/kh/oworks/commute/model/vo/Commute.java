package com.kh.oworks.commute.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Commute {
	
	private int offCateNo;			// 휴가 분류번호
	private String offCateName;		// 휴가 분류명
	private int offCateDay;			// 휴가 분류별 휴가일
	private int offGiven;			// 발생휴가
	private int offUsed;			// 사용휴가
	private int offAvailable;		// 잔여휴가
	private Date offStart;			// 휴가시작일
	private Date offEnd;			// 휴가종료일
	private String offPurpose;		// 휴가사유
	private String offApproval;		// 승인여부

	private int empNo;				// 사원번호
	private Date workDate;			// 근무일
	private String startTime;		// 출근시간
	private String endTime;			// 퇴근시간
	private String afterTime;		// 연장시간
	private String workTime;		// 근무시간
	private String workStatus;		// 근태 상태
	
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
