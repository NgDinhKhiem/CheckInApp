package org.example;

import org.example.constructors.AuctionPage;
import org.example.utils.Curl;
import org.example.utils.Processing;

import java.util.HashSet;
import java.util.Set;

public final class Main {
    private static final Set<Integer> threads = new HashSet<>();
    private static long start = 0;
    public static void main(String[] args) {
        start = System.currentTimeMillis();
        for(int i=0;i<57;i++){
           Thread object = new Thread(new Processing(i));
           threads.add(i);
           object.start();
        }
    }

    public static void checkIfTaskFinished(Integer s){
        threads.remove(s);
        if(threads.size()==0){
            System.out.println("Timer: "+(System.currentTimeMillis()-start)+"ms");
        }
    }
}