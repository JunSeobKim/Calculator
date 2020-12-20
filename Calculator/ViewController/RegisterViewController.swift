//
//  RegisterViewController.swift
//  Calculator
//
//  Created by 김준섭 on 2020/11/29.
//

import UIKit

class RegisterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let ageArray = Array(5...100)
    
    @IBOutlet weak var popRegisterVC: UIButton!
    @IBOutlet weak var emailFieldForRegisterVC: UITextField!
    @IBOutlet weak var passwordFieldForRegisterVC: UITextField!
    @IBOutlet weak var showAgePicker: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        configureTextField()
        configureTapGesture()
        createPickerView()
        dismissPickerView()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        showAgePicker.tintColor = .clear
    }
    
    @IBAction func registerTapped(_ sender: UIButton) {
        print(emailFieldForRegisterVC.text!)
        print(passwordFieldForRegisterVC.text!)
        print(showAgePicker.text!)
        print()
        
    }
    
    @IBAction func popRegisterVC(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        
    }
    
// func
    private func configureTextField() {
        emailFieldForRegisterVC.delegate = self
        passwordFieldForRegisterVC.delegate = self
        //agePickerForRegisterVC.delegate = self
        //agePickerForRegisterVC.dataSource = self
    }
    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(RegisterViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap () {
        view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ageArray.count
    }
    internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(ageArray[row])
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        showAgePicker.text = String(ageArray[row])
    }
    func createPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        showAgePicker.inputView = pickerView
    }
    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "선택", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        showAgePicker.inputAccessoryView = toolBar
    }
    @objc func action() {}
    
}

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
