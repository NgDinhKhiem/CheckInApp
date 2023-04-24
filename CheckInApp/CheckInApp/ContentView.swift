//
//  ContentView.swift
//  CheckInApp
//
//  Created by Nguyễn  Khiêm on 22/04/2023.
//

import SwiftUI
import CodeScanner

struct ContentView: View {
    var body: some View {
        VStack{
            NavigationLink(destination: CheckInScanner()){
                ZStack{
                    HStack{
                        Image(systemName: "person.badge.shield.checkmark.fill")
                        Text("Check In    ")
                    }
                    .padding(.horizontal,20)
                    .padding(.vertical,10)
                    .foregroundColor(Color.white)
                    .background(LinearGradient(gradient: Gradient(colors: [.blue,.green]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(15)
                }
            }.padding()
            
            
            NavigationLink(destination: CheckOutScanner()){
                ZStack{
                    HStack{
                        Image(systemName: "rectangle.portrait.and.arrow.right.fill")
                        Text("Check Out")
                    }
                    .padding(.horizontal,20)
                    .padding(.vertical,10)
                    .foregroundColor(Color.white)
                    .background(LinearGradient(gradient: Gradient(colors: [.red,.orange]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(15)
                }
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
