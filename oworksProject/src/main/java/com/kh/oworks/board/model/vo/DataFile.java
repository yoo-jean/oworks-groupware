package com.kh.oworks.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class DataFile {
	
	private int fileNo;			// DB_FNO
	private int boardNo;		// REF_BNO
	private String filePath;	// FILE_PATH

	

}
