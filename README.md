# MRestClient

[![CI Status](https://img.shields.io/badge/Pod-1.7.5-yellowgreen)](https://travis-ci.org/afsaredrisy/MRestClient)
[![Version](https://img.shields.io/badge/Version-0.1.0-lightgrey)](https://cocoapods.org/pods/MRestClient)
[![License](https://img.shields.io/badge/License-MIT-blue)](https://cocoapods.org/pods/MRestClient)
[![Platform](https://img.shields.io/badge/Platform-Swift%205.0-green)](https://cocoapods.org/pods/MRestClient)

## Example

MRestClient is the HTTP client implementation library written in swift, It is small , light weight & simple to use library for HTTP communication .The goal of this library is to reduce the effort to call REST-API with swift codable object. This is the generic implementation of swift object for request & response body so you can directly interact with codable object without worrying JSON conversion etc. 


To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
- [x] Xcode 11.
- [x] Swift 5.
- [x] iOS 11 or higher.

## Installation

MRestClient is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MRestClient'
```

## Usage

HTTP methos **GET** , **POST**, **PUT**  & **DELETE** are available to use, Following are the example of use case.

We will use following codable classes for request and response, 
[These-Demo](http://dummy.restapiexample.com) APIs we are using for demonostration. 

```swift 
class Employee: Codable{
    var profile_image: String
    var employee_name: String
    var employee_salary: String
    var id: String
    var employee_age: String
}

class Employees: Codable {
    var data: [Employee]
    var status: String
    init(data: [Employee], status: String) {
        self.data = data
        self.status = status
    }
}

```
**GET**
URL = http://dummy.restapiexample.com/api/v1/employees <br/>
Response JSON = Object of Empoyees

```swift
        let base_url = "http://dummy.restapiexample.com"
        let  uri = "/api/v1/employees"
        let rest_client = MRestClient<None, Employees>(base_url: base_url)
        rest_client.get(uri: uri, sucess: {(data, response) in
          
          // Do stuff on Success data is object of Empoyees class
           
       }, fail: {(error) in
           // Fail callback
       })

```
**POST**

Sample API description can found [here](http://dummy.restapiexample.com/create)

```swift
      let uri = "/api/v1/create"
      // First Generic is the type of object used in request body second used for Response body
      let rest_Client = MRestClient<EmpDTO, EmployeeWithStatus>(base_url: base_url)
      rest_Client.post(url: uri, requestData: new_employee, sucess: {(data, response)in
        
        // Do Stuff on sucess data is object of EmployeeWithStatus
        
      }, fail: {(error) in
          
          //Request has fail see error
          
      })

```
For **PUT** & **DELETE** [See](https://github.com/afsaredrisy/MRestClient/tree/master/Example) demo application 

## Contributions
If you want to improve the Demo or contribute in some way, please do so by creating a pull request. We welcome contributions.

## License

MRestClient is available under the MIT license. See the LICENSE file for more info.
