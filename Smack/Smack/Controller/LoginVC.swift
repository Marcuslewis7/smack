//
//  LoginVC.swift
//  Smack
//
//  Created by Marcus Lewis on 24/01/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    //Outlets
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    @IBAction func loginPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        
        guard let email = usernameText.text , usernameText.text != "" else { return }
        guard let password = passwordText.text , passwordText.text != "" else { return }
        
        AuthService.instance.loginUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.findUserByEmail(completion: { (success) in
                if success {
                    NotificationCenter.default.post(name: NOTIFY_USER_DATA_DID_CHANGE, object: nil)
                    self.spinner.isHidden = true
                    self.spinner.stopAnimating()
                    self.dismiss(animated: true, completion: nil)
                }
                })
            }
        }
    }
    
    
    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func createAccountButtonPressed(_ sender: Any) { performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
        
    }
    
    func setupView() {
        spinner.isHidden = true
        usernameText.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
        passwordText.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(LoginVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    
}
