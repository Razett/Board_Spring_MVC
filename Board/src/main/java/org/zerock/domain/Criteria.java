package org.zerock.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Criteria {
	
	private int pageNum = 1;
	
	private int amount = 10;
	
	private String type;
	
	private String keyword;
	
	private String origin = "";
	
	public String[] getTypeArray() {
		return type == null ? new String[] {} : type.split("");
	}

}
