//
//  NumberFormatter.swift
//  ProtoLife
//
//  Created by Joseph DeWeese on 6/1/23.
//

import Foundation


extension NumberFormatter  {
    
    static var currency:  NumberFormatter  {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}
