//
//  ViewController.swift
//  MRestClient
//
//  Created by afsaredrisy on 02/07/2020.
//  Copyright (c) 2020 afsaredrisy. All rights reserved.
//

import UIKit
import MRestClient


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    // See info.plist for http url (NOT https) use App Transport Security Settings in info.plist
    var base_url = "http://dummy.restapiexample.com"

    @IBOutlet weak var barItem: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    var employees = [Employee]()
    var activityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getTest()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "employeecell" , for: indexPath) as? EmployeeTableViewCell else{
            fatalError("No Employee cell found for employeecell identifier")
        }
        let employee = employees[indexPath.row]
        cell.name.text = employee.employee_name
        cell.salary.text = employee.employee_salary
        cell.profile_image.image = UIImage(named: "nonprofile")
        return cell
      }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let employee = employees[indexPath.row]
        guard let employeeController = storyboard?.instantiateViewController(withIdentifier: "EmployeeDetailsViewController") as? EmployeeDetailsViewController else{
            fatalError("Error instiantiating EmployeeDetailsViewController")
        }
        employeeController.employee = employee
        employeeController.editdelegate = self
        self.navigationController?.pushViewController(employeeController, animated: true)
    }

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.employees.remove(at: indexPath.row)
           tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    func startBarButtonIndicator() {
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        activityIndicator.color = .gray
        let barButton = UIBarButtonItem(customView: activityIndicator)
        self.navigationItem.setRightBarButton(barButton, animated: true)
        activityIndicator.startAnimating()
    }

    func stopBarButtonIndicator() {
        activityIndicator.stopAnimating()
        navigationItem.setRightBarButton(barItem, animated: true)
    }
    
    @IBAction func unwindToCancel(_ unwindSegue: UIStoryboardSegue) {
       // Do nothing
    }
    @IBAction func unwindToAdd(_ unwindSegue: UIStoryboardSegue) {
        guard let sourceViewController = unwindSegue.source as? AddEmployeeViewController else{
            print("Not found controler")
            return
        }
        guard let new_employe = sourceViewController.employee else{
            return
        }
        postTest(new_employee: new_employe)
    }
    
    
    
}

//MARK: GET Request Demo with Codable Employee object
/**
 URI  = /api/v1/employees
 Response : List of Employee data
 */
extension ViewController{
    private func getTest(){
        startBarButtonIndicator()
        let  uri = "/api/v1/employees"
        let rest_client = MRestClient<None, Employees>(base_url: base_url)
        rest_client.get(uri: uri, sucess: {(data, response) in
            DispatchQueue.main.async {
                if data.data.count != 0{
                    self.employees = data.data
                    self.tableView.reloadData()
                }
                self.stopBarButtonIndicator()
            }
            
        }, fail: {(error) in
            DispatchQueue.main.async {
                self.stopBarButtonIndicator()
            }
            print("Error \(String(describing: error))")
        })
        
    }
}

//MARK: POST request Demo with codable
/**
 URI  = /api/v1/create
 Request_Body : Employee Object to be added e.g {"name":"test","salary":"123","age":"23"}
 Response : Added Employe with id  e.g
 {
     "status": "success",
     "data": {
         "name": "test",
         "salary": "123",
         "age": "23",
         "id": 25
     }
 }
 
 EmployeeWithStatus.swift
 
 */

extension ViewController {
    private func postTest(new_employee: EmpDTO){
        let uri = "/api/v1/create"
        self.startBarButtonIndicator()
        let rest_Client = MRestClient<EmpDTO, EmployeeWithStatus>(base_url: base_url)
        rest_Client.post(url: uri, requestData: new_employee, sucess: {(data, response)in
            DispatchQueue.main.async {
                self.stopBarButtonIndicator()
                // Fetch Employee again with GET to get updated list
                self.getTest()
            }
        }, fail: {(error) in
            DispatchQueue.main.async {
                self.stopBarButtonIndicator()
            }
        })
    }
}

//MARK: DELETE request Demo with codable
/**
 Not Yet implemented in demo but functionaties is there in MRestClient
 Any pull Request will be highly appriciated with any demo URL
 */
extension ViewController{

    private func deleteTest(){
        
    }
    
    
}


// MARK: PUT reques Demo with MRestClient & Codable object

/**
 
 URI = /update/{id}
 Request Body : {"name":"test1","salary":"1123","age":"23"}
 Response Body : {
     "status": "success",
     "data": {
         "name": "test",
         "salary": "1243",
         "age": "23",
         "id": "25"
     }
 }
 
 */
extension ViewController: EditDelegate{
    func didEditItem(emp: EmpDTO) {
        putTest(emp: emp)
    }
    private func putTest(emp: EmpDTO){
        startBarButtonIndicator()
        let uri = "/update/\(emp.id)"
   
        let mrest_client = MRestClient<EmpDTO, EmployeeWithStatus>(base_url: base_url)
        mrest_client.put(url: uri, requestData: emp, sucess: {(data, response) in
            DispatchQueue.main.async {
                self.stopBarButtonIndicator()
            }
            
        }, fail: {(error)in
            DispatchQueue.main.async {
                self.stopBarButtonIndicator()
            }
            
        })
    }

}
