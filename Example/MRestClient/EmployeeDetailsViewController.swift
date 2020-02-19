//
//  EmployeeDetailsViewController.swift
//  MRestClient_Example
//
//  Created by Afsar Sir on 19/02/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

protocol EditDelegate {
    func didEditItem(emp: EmpDTO)
}


class EmployeeDetailsViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var profie_image: UIImageView!
    
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var salary: UITextField!
    var editdelegate: EditDelegate?
    var employee: Employee?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let employee = self.employee else{
            fatalError("No emplyee object found")
        }
        
        self.name.text = employee.employee_name
        self.age.text = employee.employee_age
        self.salary.text = employee.employee_salary
        profie_image.layer.cornerRadius = profie_image.bounds.width/4
        noneEdit()
    }
    fileprivate func noneEdit(){
        name.borderStyle = UITextField.BorderStyle.none
        age.borderStyle = UITextField.BorderStyle.none
        salary.borderStyle = UITextField.BorderStyle.none
        name.isUserInteractionEnabled = false
        age.isUserInteractionEnabled = false
        salary.isUserInteractionEnabled = false
    }
    fileprivate func editable(){
        name.borderStyle = UITextField.BorderStyle.line
        age.borderStyle = UITextField.BorderStyle.line
        salary.borderStyle = UITextField.BorderStyle.line
        name.isUserInteractionEnabled = true
        age.isUserInteractionEnabled = true
        salary.isUserInteractionEnabled = true
    }
    
    @IBAction func edit(_ sender: Any) {
        if let button = sender as? UIBarButtonItem{
            if button.title == "Edit"{
                button.title = "Done"
                editable()
            }
            else if button.title == "Done"{
                button.title = "Edit"
                noneEdit()
                if editdelegate != nil{
                    let id = Int(employee!.id) ?? 0
                    let emp = EmpDTO(id: id, name: name.text!, salary: salary.text!, age: age.text!)
                    editdelegate?.didEditItem(emp: emp)
                }
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
extension UIImageView {
    func roundedImage() {
        self.layer.cornerRadius = (self.frame.size.width) / 2;
        self.clipsToBounds = true
        self.layer.borderWidth = 3.0
        self.layer.borderColor = UIColor.white.cgColor
    }
}
