//
//  Employee.swift
//  MRestClient_Example
//
//  Created by Afsar Sir on 19/02/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation

class Employee: Codable{
    var profile_image: String
    var employee_name: String
    var employee_salary: String
    var id: String
    var employee_age: String
    
    init(id: String, employee_name: String, employee_salary: String, employee_age: String, profile_image: String ) {
        self.id=id
        self.employee_name=employee_name
        self.employee_age=employee_age
        self.employee_salary=employee_salary
        self.profile_image = profile_image
    }

    /**
    required init(from decoder: Decoder)
     Required for some special cases see this Stack overflow question https://stackoverflow.com/questions/44575293/with-jsondecoder-in-swift-4-can-missing-keys-use-a-default-value-instead-of-hav
     */
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Init for Name
        if let employee_name = try container.decodeIfPresent(String.self, forKey: .employee_name){
            self.employee_name = employee_name
        }
        else{
            self.employee_name = "NA"
        }
        // Init for Salary
        if let employee_salary = try container.decodeIfPresent(String.self, forKey: .employee_salary){
            self.employee_salary = employee_salary
        }
        else{
            self.employee_salary = "NA"
        }
        // Init for profile_image
        if let profile_image = try container.decodeIfPresent(String.self, forKey: .profile_image){
            self.profile_image = profile_image
        }
        else{
            self.profile_image = "NA"
        }
        if let employee_age = try container.decodeIfPresent(String.self, forKey: .employee_age){
                  self.employee_age = employee_age
            }
        else{
            self.employee_age = "NA"
        }
        if let employee_id = try container.decodeIfPresent(String.self, forKey: .id){
            self.id = employee_id
            }
        else{
            self.id = "NA"
        }
    }
}
