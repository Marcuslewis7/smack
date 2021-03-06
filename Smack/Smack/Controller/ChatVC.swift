//
//  ChatVC.swift
//  Smack
//
//  Created by Marcus Lewis on 24/01/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    //Outlets
    @IBOutlet weak var menuButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail(completion: { (success) in
                NotificationCenter.default.post(name: NOTIFY_USER_DATA_DID_CHANGE, object: nil)
            })
        }
        MessageService.instance.findAllChannel { (success) in
            
        }
    }
    

    
    
    
}
