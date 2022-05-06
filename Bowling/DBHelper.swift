//
//  DBHelper.swift
//  Bowling
//
//  Created by DM on 2021/06/11.
//

import Foundation
import SQLite3
import UIKit


struct Response: Codable {
    let success: Bool
    let result: String
    let message: String
}

func requestGet(url: String, completionHandler: @escaping(Bool, Any) -> Void) {

}

class DBHelper {

}
