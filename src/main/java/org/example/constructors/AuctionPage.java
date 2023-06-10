package org.example.constructors;

public class AuctionPage {
    private boolean success;
    private int page;
    private int totalPages;
    private int totalAuctions;
    private long lastUpdated;
    private Item[] auctions;

    public boolean isSuccess() {
        return success;
    }

    public int getPage() {
        return page;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public int getTotalAuctions() {
        return totalAuctions;
    }

    public long getLastUpdated() {
        return lastUpdated;
    }

    public Item[] getAuctions() {
        return auctions;
    }
}
