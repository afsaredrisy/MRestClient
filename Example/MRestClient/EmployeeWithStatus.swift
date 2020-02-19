//
//  EmployeeWithStatus.swift
//  MRestClient_Example
//
//  Created by Afsar Sir on 19/02/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation


class EmployeeWithStatus: Codable{
    var status : String
    var data: EmpDTO
    
    init(status: String, data: EmpDTO) {
        self.status = status
        self.data = data
    }
    
}


class EmpDTO: Codable{
    var name: String
    var id: Int
    var salary: String
    var age: String
    
    init(id: Int, name: String, salary: String, age: String) {
        self.name = name
        self.id = id
        self.salary = salary
        self.age = age
    }
}
class DeleteEmpResponse: Codable {
    var status: String
    var message: String
    
    init(status: String, message: String) {
        self.status = status
        self.message = message
    }
    
}
