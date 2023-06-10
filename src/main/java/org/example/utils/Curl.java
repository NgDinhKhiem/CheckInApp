package org.example.utils;

import com.google.gson.Gson;
import org.example.constructors.AuctionPage;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

public class Curl {
    private final String rawData;
    public Curl(String path){
        StringBuilder str = new StringBuilder();
        try {
            URL url = new URL(path);
            BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));
            for(String line:reader.lines().toList()){
                str.append(line);
            }
            reader.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        rawData = str.toString();
    }

    public AuctionPage getAuctionPage(){
        return new Gson().fromJson(this.rawData, AuctionPage.class);
    }
}
