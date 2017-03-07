package util;

import lombok.Data;
import lombok.Getter;

@Data
public class Pagination {
	@Getter
	private int rowCount,pageNO,pageStart,pageEnd,count,pageCount,blockSize,blockStart,prevBlock,nextBlock,blockEnd;
	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}

	public void setPageNO(String pageNO) {
		this.pageNO = Integer.parseInt(pageNO);
	}

	public void setPageStart() {
		this.pageStart = (pageNO-1)*rowCount+1;
	}

	public void setPageEnd() {
		this.pageEnd = pageNO*rowCount;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public void setPageCount() {
		pageCount=(count%rowCount==0)?count/rowCount:count/rowCount+1;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public void setBlockStart() {
		this.blockStart = pageNO-((pageNO-1)%blockSize);
	}

	public void setPrevBlock() {
		this.prevBlock = blockStart-blockSize;
	}

	public void setNextBlock() {
		this.nextBlock = blockStart+blockSize;
	}

	public void setBlockEnd() {
		blockEnd=(blockStart+rowCount-1 < pageCount)?blockStart+blockSize-1:pageCount;
	}
	public Integer[] getAttribute(){
		Integer[] arr={count,pageCount,pageNO,pageStart,pageEnd,blockStart,blockEnd,prevBlock,nextBlock};
		return arr;
	}
}
