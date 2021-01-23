//
//  RegisterViewController.swift
//  Calculator
//
//  Created by 김준섭 on 2020/12/21.
//

import UIKit
import Alamofire

class EmailRegisterViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmpassword: UITextField!
    @IBOutlet weak var emailCheck: UILabel!
    @IBOutlet weak var passwordCheck: UILabel!
    @IBOutlet weak var confirmPasswordCheck: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailCheck.isHidden = true
        passwordCheck.isHidden = true
        confirmPasswordCheck.isHidden = true
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class PasswordRegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
