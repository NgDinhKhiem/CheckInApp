//
//  CheckInScanner.swift
//  CheckInApp
//
//  Created by Nguyễn  Khiêm on 24/04/2023.
//

import SwiftUI
import CarBode
import AVFoundation

struct CheckInScanner: View {
    @State private var isLoading = false
    @State private var isShowingScanner = false
    @State private var scannedCode: String = ""
    @State private var id: String = ""
    
    var scanner : some View{
        CBScanner(
            supportBarcode: .constant([.qr, .code39, .code128]),
            scanInterval: .constant(1.0)
        ){
            let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
            if $0.value.rangeOfCharacter(from: characterset.inverted) != nil {
                if($0.value.contains("https://ctsv.hust.edu.vn/#/card/")){
                    var temp = $0.value
                    temp.replace("https://ctsv.hust.edu.vn/#/card/", with: "")
                    temp = String(temp.prefix(8))
                    self.id=temp
                    self.isShowingScanner=false
                    self.isLoading=true
                    doSmth()
                    return
                }
                return
            }
            
            self.id = $0.value
            self.isShowingScanner=false
            self.isLoading=true
            doSmth()
        }
    }
    
    func doSmth(){
        Task{
            if(QRResolver.getMethod(path: "http://vps-ab8c14d4.vps.ovh.ca:8080/api?id="+id+"&isCheckIn=true")){
                scannedCode = "Check In Complete"
            }else{
                scannedCode = "Check In Invalid"
            }
        }
        self.isLoading=false
    }
    
    var body: some View {
        VStack{
            Text(id)
                .padding()
            
            Text(scannedCode)
                .padding()
            if(isLoading){
                HStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 10, height: 10)
                        .scaleEffect(isLoading ? 1.0 : 0.5)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever())
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 10, height: 10)
                        .scaleEffect(isLoading ? 1.0 : 0.5)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(0.3))
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 10, height: 10)
                        .scaleEffect(isLoading ? 1.0 : 0.5)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(0.6))
                }
                .padding()
            }
            ZStack{
                HStack{
                    Image(systemName: "qrcode.viewfinder")
                    Text("Scan").onTapGesture {
                        isShowingScanner=true
                    }.sheet(isPresented: $isShowingScanner){
                        self.scanner
                    }
                }
                .padding(.horizontal,20)
                .padding(.vertical,10)
                .foregroundColor(Color.white)
                .background(LinearGradient(gradient: Gradient(colors: [.red,.orange]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(15)
            }
        }.padding()
            .navigationTitle("Check In")
            .navigationBarTitleDisplayMode(.inline)
    }
}
