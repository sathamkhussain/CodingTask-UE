//
//  Constants.swift
//  TaskSmartDu
//
//  Created by Satham Hussain on 08/05/2023.
//

import Foundation
enum APIKeys {
    case newyorkTimes
}

extension APIKeys {
    var value: String {
        switch self {
        case .newyorkTimes:
            return "9HHhKg12Zp1Ns1lIP6Xu3PTAnj4AG6Yf"
        }
    }
}
