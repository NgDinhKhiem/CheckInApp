package org.example.constructors;

public class Item {
    private String uuid;
    private String auctioneer;
    private String profile_id;
    private String[] coop;
    private long start;
    private long end;
    private String item_name;
    private String item_lore;
    private String extra;
    private String category;
    private String tier;
    private long starting_bid;
    private String item_bytes;
    private boolean claimed;
    private long highest_bid_amount;
    private long last_updated;
    private boolean bin;

    public String getUuid() {
        return uuid;
    }

    public String getAuctioneer() {
        return auctioneer;
    }

    public String getProfile_id() {
        return profile_id;
    }

    public String[] getCoop() {
        return coop;
    }

    public long getStart() {
        return start;
    }

    public long getEnd() {
        return end;
    }

    public String getItem_name() {
        return item_name;
    }

    public String getItem_lore() {
        return item_lore;
    }

    public String getExtra() {
        return extra;
    }

    public String getCategory() {
        return category;
    }

    public String getTier() {
        return tier;
    }

    public long getStarting_bid() {
        return starting_bid;
    }

    public String getItem_bytes() {
        return item_bytes;
    }

    public boolean isClaimed() {
        return claimed;
    }

    public long getHighest_bid_amount() {
        return highest_bid_amount;
    }

    public long getLast_updated() {
        return last_updated;
    }

    public boolean isBin() {
        return bin;
    }
}
