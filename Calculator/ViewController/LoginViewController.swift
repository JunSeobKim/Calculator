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
    @IBOutlet weak var emailCheck: UILabel!
    @IBOutlet weak var passwordCheck: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    
    // MARK: - IBAction
    
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    @IBAction func loginTapped(_ sender: UIButton) {
        // Check email
        if email.text == "" {
            email.layer.borderWidth = 1
            email.layer.borderColor = UIColor.systemPink.cgColor
            emailCheck.isHidden = false
        }
        // Check password
        if password.text == "" {
            password.layer.borderWidth = 1
            password.layer.borderColor = UIColor.systemPink.cgColor
            passwordCheck.isHidden = false
        }
        if email.text != "", password.text != "" {
            // TODO: send server
            print("Login...")
        }
    }
    
    // MARK: - Function
    
    func callCalculator() {
        // https://api.spoonacular.com/food/trivia/random?apiKey=f78347a30c0e43a8be0fad4a9c491509
        
        AF.request("http://54.180.24.44:4000/food/foodtrivia")
            .responseString { (string) in
                switch string.result {
                        case .success(let data):
                            print(data)
                        case let .failure(error):
                            print(error)
                        }
            }
    }
    
    func signUp(){
        let param = [
            "email": "wnstjq616@gmail.com",
            "username": "kimjunseob",
            "password": "12345678",
            "gender": "male",
            "age": "20"
        ]
        
        AF.request("http://54.180.24.44:4000/user/signup", method: .post, parameters: param, encoding: JSONEncoding.default)
            .responseJSON { (response) in
                print("success")
            }
    }
    /*
     email: email,
         username: username,
         password: password,
         gender: value,
         age: age,
     
     */
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.email.becomeFirstResponder()
        email.delegate = self
        password.delegate = self
        emailCheck.isHidden = true
        passwordCheck.isHidden = true
        //TODO: 돌아가기 누르면 pop 시키기
        callCalculator()
        signUp()
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
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let textId = textField.restorationIdentifier, textId == "email" {
            emailCheck.isHidden = true
        }
        if let textId = textField.restorationIdentifier, textId == "password" {
            passwordCheck.isHidden = true
        }
        textField.layer.borderWidth = 0
    }
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
