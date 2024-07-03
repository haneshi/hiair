package hiair_project1.dto;

public class Pager {
	//페이징 처리를 위한 정보를 관리하는 클래스
	//웹 개발에서 페이징 처리는 사용자에게 데이터를 페이지 단위로 나누어 보여주기 위해 사용

	private int page; //현재 페이지 번호
	private int size; //페이지당 표시할 행의 수
	private int bsize; //한 블록에 포함될 페이지 수
	
	private int rows; // 총 요소(데이터)의 수
	private int pages; //계산을 통해 도출된 총 페이지 수
	private int blocks; //계산을 통해 도출된 총 블록 수
	
	private int block; //현재 블록 번호
	private int bspage; //현재 블록의 시작 페이지 번호
	private int bepage; //현재 블록의 마지막 페이지 번호
	
	public Pager() {}
	
	public Pager(int page, int size, int bsize, int rows) {
		super();
		//현재페이지
		this.page = page;
		//한페이지당 게시물개수
		this.size = size;
		//블럭당페이지사이즈(기본5개로 되어 있음)
		//페이지5개씩 한블럭에 표시되고 넘어가면 >> 표시가 나옴
		this.bsize = bsize;
		//총게시물 건수
		this.rows = rows;
		//총페이지
		pages = (int)Math.ceil((double)this.rows/this.size);
		//총블럭
		blocks = (int)Math.ceil((double)pages/this.bsize);
		//현재블럭
		block = (int)Math.ceil((double)this.page/this.size);
		//현재블럭 종료페이지
		bepage = block * this.size;
		//현재페이지 시작페이지
		bspage = bepage - this.bsize + 1;
	}
	
	
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getBsize() {
		return bsize;
	}

	public void setBsize(int bsize) {
		this.bsize = bsize;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public int getPages() {
		return pages;
	}

	public void setPages(int pages) {
		this.pages = pages;
	}

	public int getBlocks() {
		return blocks;
	}

	public void setBlocks(int blocks) {
		this.blocks = blocks;
	}

	public int getBlock() {
		return block;
	}

	public void setBlock(int block) {
		this.block = block;
	}

	public int getBspage() {
		return bspage;
	}

	public void setBspage(int bspage) {
		this.bspage = bspage;
	}

	public int getBepage() {
		return bepage;
	}

	public void setBepage(int bepage) {
		this.bepage = bepage;
	}

	//두번째 페이지이고 한페이지에 10개씩 이라면 10을 리턴
	public static int seekOffset(int page, int size) {
		if(page > 0) {
			return (page-1) * size;
		}
		return 0;
	}
	
	//두번째 페이지이고 한페이지에 10개씩 이라면 11을 리턴
	public static int Start(int page, int size) {
		return ((page - 1) * size) + 1;
	}
	
	//두번째 페이지이고 한페잊에 10개씩 이라면 20을 리턴
	public static int End(int page, int size) {
		return page * size;
	}
}
