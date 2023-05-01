//
//  BarCodeScanner.swift
//  CheckInApp
//
//  Created by Nguyễn  Khiêm on 24/04/2023.
//

import Foundation
import SwiftUI
import CarBode
import AVFoundation

struct BarCodeScanner: View{
    
    var body: some View{
        VStack{
            CBScanner(
                supportBarcode: .constant([.qr, .code39]), //Set type of barcode you want to scan
                scanInterval: .constant(1.0) //Event will trigger every 5 seconds
            ){
                //When the scanner found a barcode
                print("BarCodeType =",$0.type.rawValue, "Value =",$0.value)
            }

        }
        
    }
}
