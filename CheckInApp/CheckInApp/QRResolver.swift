//
//  QRResolver.swift
//  CheckInApp
//
//  Created by Nguyễn  Khiêm on 24/04/2023.
//

import Foundation
struct QRResolver{
    public static func getMethod(path:String) ->Bool {
        let myURLString = path
        guard let myURL = URL(string: myURLString) else {
            print("Error: \(myURLString) doesn't seem to be a valid URL")
            return false
        }

        do {
            let myHTMLString = try String(contentsOf: myURL, encoding: .ascii)
            print(myHTMLString)
            if(myHTMLString=="true"||myHTMLString=="false"){return true}
            else{ return false }
        } catch let error {
            print("Error: \(error)")
            return false
        }
    }
}
