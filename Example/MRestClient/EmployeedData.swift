//
//  EmployeedData.swift
//  MRestClient_Example
//
//  Created by Afsar Sir on 19/02/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation


class Employees: Codable {
    var data: [Employee]
    var status: String
    
    
    init(data: [Employee], status: String) {
        self.data = data
        self.status = status
    }
    
    
}
