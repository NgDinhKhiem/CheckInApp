package org.example.utils;

import org.example.Main;
import org.example.constructors.AuctionPage;
import org.example.constructors.Item;

import java.util.List;

public class Processing implements Runnable{
    private final int i;
    public Processing(int i){
        this.i=i;
    }

    public void run(){
        Curl curl = new Curl("https://api.hypixel.net/skyblock/auctions?page="+i);
        AuctionPage auctionPage = curl.getAuctionPage();
        List.of(auctionPage.getAuctions()).forEach(this::process);
        Main.checkIfTaskFinished(i);
    }

    private void process(Item item){
        //Processing step is hidden :D
    }
}
