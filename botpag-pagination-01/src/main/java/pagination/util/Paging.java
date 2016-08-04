package pagination.util;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * @author PHEARUN
 * 
 * */
public class Paging implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@JsonProperty("PAGE")
	private int page;

	@JsonProperty("LIMIT")
	private int limit;

	@JsonProperty("TOTAL_COUNT")
	private Long totalCount;

	@JsonProperty("TOTAL_PAGES")
	private Long totalPages;

	@JsonIgnore
	private int offset;

	public Paging() {
		this(1, 10, 0L, 0L);
	}

	public Paging(int page, int limit) {
		this.page = page;
		this.limit = limit;
		this.totalCount = 0L;
		this.totalPages = 0L;
	}

	public Paging(int page, int limit, Long totalCount, Long totalPages) {
		this.page = page;
		this.limit = limit;
		this.totalCount = totalCount;
		this.totalPages = totalPages;
	}

	public int getPage() {
		return page;
	}

	public int totalPages() {
		return (int) Math.ceil((double) this.totalCount / limit);

	}

	public int nextPage() {
		return this.page + 1;
	}

	public int previousPage() {
		return this.page - 1;
	}

	public boolean hasNextPage() {
		return this.nextPage() <= this.totalPages() ? true : false;
	}

	public boolean hasPreviousPage() {
		return this.previousPage() >= 1 ? true : false;
	}

	public int offset() {
		this.offset = (this.page - 1) * limit;
		return this.offset;
	}

	public void setPage(int currentPage) {
		this.page = currentPage;
		this.offset();
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public Long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Long totalCount) {
		this.totalCount = totalCount;
		this.totalPages = (long) totalPages();
	}

	public Long getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(Long totalPages) {
		this.totalPages = totalPages;
	}

	/**
	 * @return the offset
	 */
	public int getOffset() {
		return this.offset();
	}

	/**
	 * @param offset
	 *            the offset to set
	 */
	public void setOffset(int offset) {
		this.offset = offset;
	}

	@Override
	public String toString() {
		return "Paging [page=" + page + ", limit=" + limit + ", totalCount=" + totalCount + ", totalPages=" + totalPages
				+ ", offset=" + offset + "]";
	}

	
}
