package org.zerock.domain;

import lombok.Data;

/**
 * 작성자와 작성 글 개수를 저장합니다.
 */
@Data
public class RankVO {
	
	private String writer;
	private long count;

}
