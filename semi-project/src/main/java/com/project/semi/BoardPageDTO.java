package com.project.semi;

public class BoardPageDTO {
	int pageNum, cntPerPage;

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	@Override
	public String toString() {
		return "BoardPageDTO [pageNum=" + pageNum + ", cntPerPage=" + cntPerPage + "]";
	}
	
	
}