//
//  ViewController.swift
//  Calculator
//
//  Created by 김준섭 on 2020/11/27.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    // MARK: - IBAction
    
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    @IBAction func loginTapped(_ sender: UIButton) {
        // TODO: 로그인 버튼
        print("로그인 누름")
    }
    
    // MARK: - Function
    
    func callCalculator() {
        AF.request("https://api.spoonacular.com/food/trivia/random?apiKey=f78347a30c0e43a8be0fad4a9c491509").response { response in
            debugPrint(response)
            print(response)
        }
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.email.becomeFirstResponder()
        email.delegate = self
        password.delegate = self
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

// MARK: - EXTENSION
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // if emailTextField go to passwordTextField
        if let textId = textField.restorationIdentifier, textId == "email" {
            password.becomeFirstResponder()
        }
        // if passwordTextField go to loginTapped
        if let textId = textField.restorationIdentifier, textId == "password" {
            self.loginTapped(self.loginBtn)
        }
        return true
    }
}
