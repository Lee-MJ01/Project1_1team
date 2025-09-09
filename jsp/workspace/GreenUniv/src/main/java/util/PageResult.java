package util;

import java.util.List;

public class PageResult<T> {
    private final List<T> items;
    private final int page;          // 현재 페이지(1-base)
    private final int size;          // 페이지 크기
    private final int totalCount;    // 전체 건수
    private final int totalPages;    // 전체 페이지

    // 페이지바(블록) 정보
    private final int blockSize;     // 한 블록에 몇 개의 페이지 번호를 보여줄지 (예: 5)
    private final int startPage;     // 현재 블록 시작 페이지
    private final int endPage;       // 현재 블록 끝 페이지
    private final boolean hasPrev;   // 이전 페이지 존재
    private final boolean hasNext;   // 다음 페이지 존재
    private final boolean hasPrevBlock;
    private final boolean hasNextBlock;

    public PageResult(List<T> items, int page, int size, int totalCount, int blockSize) {
        this.items = items;
        this.page = Math.max(page, 1);
        this.size = size;
        this.totalCount = totalCount;
        this.totalPages = (int)Math.ceil(totalCount / (double)size);
        this.blockSize = blockSize;

        int sp = ((this.page - 1) / blockSize) * blockSize + 1;
        int ep = Math.min(sp + blockSize - 1, Math.max(this.totalPages, 1));
        this.startPage = sp;
        this.endPage   = ep;

        this.hasPrev = this.page > 1;
        this.hasNext = this.page < this.totalPages;
        this.hasPrevBlock = this.startPage > 1;
        this.hasNextBlock = this.endPage   < this.totalPages;
    }

    public List<T> getItems() { return items; }
    public int getPage() { return page; }
    public int getSize() { return size; }
    public int getTotalCount() { return totalCount; }
    public int getTotalPages() { return totalPages; }
    public int getBlockSize() { return blockSize; }
    public int getStartPage() { return startPage; }
    public int getEndPage() { return endPage; }
    public boolean isHasPrev() { return hasPrev; }
    public boolean isHasNext() { return hasNext; }
    public boolean isHasPrevBlock() { return hasPrevBlock; }
    public boolean isHasNextBlock() { return hasNextBlock; }
}
