package com.kh.oworks.approval.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class FilePath {
	
	private int fileNo;
	private String appNo;
	private String orgFileName;
	private String mdfFileName;
	private String filePath;
	
}
