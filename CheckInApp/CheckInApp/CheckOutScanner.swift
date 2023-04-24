//
//  CheckOutScanner.swift
//  CheckInApp
//
//  Created by Nguyễn  Khiêm on 24/04/2023.
//

import SwiftUI
import CodeScanner


struct CheckOutScanner: View {
    @State private var isShowingScanner = false
    @State private var scannedCode: String = ""
    @State private var id: String = ""
    
    @MainActor
    func executeQuery() async{
        scannedCode="lmao"
    }
    
    var scannerSheet : some View{
        CodeScannerView(
            codeTypes: [.qr],
            completion:{ result in
                if case let .success(code) = result {
                    self.id = code.string
                    self.isShowingScanner=false
                    Task{
                        if(QRResolver.getMethod(path: "http://vps-ab8c14d4.vps.ovh.ca:8080/api?id="+code.string+"&isCheckIn=false")){
                            scannedCode = "Check Out Complete"
                        }else{
                            scannedCode = "Check Out Got Error"
                        }
                    }
            }
        })
    }
    
    var body: some View {
        VStack{
            Text(id)
                .padding()
            
            Text(scannedCode)
                .padding()
            ZStack{
                HStack{
                    Image(systemName: "qrcode.viewfinder")
                    Text("Scan").onTapGesture {
                        isShowingScanner=true
                    }.sheet(isPresented: $isShowingScanner){
                        self.scannerSheet
                    }
                }
                .padding(.horizontal,20)
                .padding(.vertical,10)
                .foregroundColor(Color.white)
                .background(LinearGradient(gradient: Gradient(colors: [.green,.orange]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(15)
            }
        }.padding()
            .navigationTitle("Check Out")
            .navigationBarTitleDisplayMode(.inline)
    }
    
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
       // more code to come
    }
}
