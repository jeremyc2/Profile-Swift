//
//  MainControllerExt.swift
//  Profile
//
//  Created by Jeremy Ryan Chandler on 3/13/20.
//  Copyright © 2020 Jeremy Chandler. All rights reserved.
//

import UIKit

extension MainController {
    
    @objc func nameInputSegue(_ sender: UITapGestureRecognizer? = nil) {
        
        print("Name Input Segue")
        
        print("Under Construstion")
        
    }
    
    @objc func phoneInputSegue(_ sender: UITapGestureRecognizer? = nil) {
        
        print("Phone Input Segue")
        
        let viewController:StandardDetailController = StandardDetailController(title: "What's your phone number?", label: "Your phone number", text: "(801) 472-8755")
        
        viewController.modalPresentationStyle = .fullScreen
        
        self.present(viewController, animated:false, completion:nil)
        
    }
    
    @objc func emailInputSegue(_ sender: UITapGestureRecognizer? = nil) {
        
        print("Email Input Segue")
        
        let viewController:StandardDetailController = StandardDetailController(title: "What's your email?", label: "Your email address", text: "Timcook@icloud.com")
        
        viewController.modalPresentationStyle = .fullScreen
        
        self.present(viewController, animated:false, completion:nil)
        
    }
    
    @objc func descriptionInputSegue(_ sender: UITapGestureRecognizer? = nil) {
        
        print("Description Input Segue")
        
        print("Under Construction")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let nameInputTap = UITapGestureRecognizer(target: self, action: #selector(nameInputSegue(_:)))
        let phoneInputTap = UITapGestureRecognizer(target: self, action: #selector(phoneInputSegue(_:)))
        let emailInputTap = UITapGestureRecognizer(target: self, action: #selector(emailInputSegue(_:)))
        let descriptionInputTap = UITapGestureRecognizer(target: self, action: #selector(descriptionInputSegue(_:)))
        
        nameInput.addGestureRecognizer(nameInputTap)
        phoneInput.addGestureRecognizer(phoneInputTap)
        emailInput.addGestureRecognizer(emailInputTap)
        descriptionInput.addGestureRecognizer(descriptionInputTap)

    }
}
