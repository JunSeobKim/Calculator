//
//  ViewController.swift
//  Calculator
//
//  Created by 김준섭 on 2020/11/27.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailFieldForLoginVC: UITextField!
    @IBOutlet weak var passwordFieldForLoginVC: UITextField!
    @IBOutlet weak var loginButton: UIButton!

// func
    func callCalculator() {
        AF.request("https://api.spoonacular.com/food/trivia/random?apiKey=f78347a30c0e43a8be0fad4a9c491509").response { response in
            debugPrint(response)
            print(response)
        }
    }
    
    private func configureTextFields() {
        emailFieldForLoginVC.delegate = self
        passwordFieldForLoginVC.delegate = self
    }
    
    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap () {
        view.endEditing(true)
    }
    
// IBAction
    @IBAction func loginTapped(_ sender: UIButton) {
        print(emailFieldForLoginVC.text!)
        print(passwordFieldForLoginVC.text!)
        //TODO: error handling
        view.endEditing(true)
    }
    
// viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        //callCalculator()
        configureTextFields()
        navigationController?.isNavigationBarHidden = true

    }
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

