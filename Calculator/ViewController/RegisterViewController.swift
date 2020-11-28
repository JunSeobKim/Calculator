//
//  RegisterViewController.swift
//  Calculator
//
//  Created by 김준섭 on 2020/11/29.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var popRegisterVC: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationController?.isNavigationBarHidden = true
    }

    
    @IBAction func popRegisterVC(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
}

