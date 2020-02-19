//
//  AddEmployeeViewController.swift
//  MRestClient_Example
//
//  Created by Afsar Sir on 19/02/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class AddEmployeeViewController: UIViewController {

    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var salary: UITextField!
    @IBOutlet weak var name: UITextField!
    var employee: EmpDTO?
    var shouldPerformSegue=false
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        guard let emp_name = name.text,
                 let emp_salary = salary.text,
                 let emp_age = age.text else{
                    
                     return false
             }
             if (emp_name == "" || emp_salary == "" || emp_age == "") {
                 self.showAlert(msg: "Enter all values")
                 
                 return false
             }
        self.employee = EmpDTO(id: 0, name: emp_name, salary: emp_salary, age: emp_age)
        return true
    }
    
    

   

}

extension UIViewController{
    func showAlert(msg: String){
        
       
        let alert = UIAlertController(title: "MRestDemo Alert", message: msg, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            
            //alert.dismiss(animated: true, completion: nil)
            
        }))
        present(alert, animated: true, completion: nil)
    }
}
