package org.zerock.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {

	private Criteria criteria;

	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;

	private long count;

	public PageDTO(Criteria criteria, long count) {
		this.criteria = criteria;
		this.count = count;

//		this.endPage = (int) (Math.ceil(criteria.getPageNum() / 5.0) * 5);
//		this.startPage = this.endPage - 4;
		
		this.endPage = criteria.getPageNum() + 2;
		this.startPage = endPage - 4;
		
		int realEndPage = (int) Math.ceil((count * 1.0) / criteria.getAmount());
		
		this.endPage = this.endPage < 5 ? 5 : this.endPage;
		this.endPage = realEndPage < this.endPage ? realEndPage : this.endPage;
		this.startPage = this.endPage - 5 < this.startPage ? this.endPage - 4 : this.startPage;
		this.startPage = this.startPage < 1 ? 1 : startPage;
		
		this.prev = (startPage != 1);
		this.next = (this.endPage < realEndPage);
	}
}
