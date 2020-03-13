//
//  MainController.swift
//  Profile
//
//  Created by Jeremy Ryan Chandler on 3/6/20.
//  Copyright © 2020 Jeremy Chandler. All rights reserved.
//

import UIKit
import LBTATools

class MainController: UIViewController {
    
    @objc func nameInputSegue(_ sender: UITapGestureRecognizer? = nil) {
        
        print("Name Input Segue")
        
        print("Under Construstion")
        
    }
    
    @objc func phoneInputSegue(_ sender: UITapGestureRecognizer? = nil) {
        
        print("Phone Input Segue")
        
        let nameInputViewController:StandardDetailController = StandardDetailController(title: "What's your phone number?", label: "Your phone number", text: "(801) 472-8755")
        
        self.present(nameInputViewController, animated:true, completion:nil)
        
    }
    
    @objc func emailInputSegue(_ sender: UITapGestureRecognizer? = nil) {
        
        print("Email Input Segue")
        
        let nameInputViewController:StandardDetailController = StandardDetailController(title: "What's your email?", label: "Your email address", text: "Timcook@icloud.com")
        
        self.present(nameInputViewController, animated:true, completion:nil)
        
    }
    
    @objc func descriptionInputSegue(_ sender: UITapGestureRecognizer? = nil) {
        
        print("Description Input Segue")
        
        print("Under Construction")
        
    }
    
    var mainLabel:UILabel = {
        var label:UILabel = UILabel()
        
        label.font = Theme.mainFont
        label.textColor = Theme.mainColor
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var profilePic: UIImageView = {
        let diameter = CGFloat(150)
        
        var iv:UIImageView = UIImageView(image: UIImage(named: "Image"))
                
        iv.withHeight(diameter)
        iv.withWidth(diameter)
        
        iv.layer.cornerRadius = diameter / 2
        
        iv.layer.borderWidth = 5
        iv.layer.borderColor = Theme.mainColor.cgColor
        
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        
                
        return iv
    }()
    
    var nameInput:DescriptorView = DescriptorView()
    var phoneInput:DescriptorView = DescriptorView()
    var emailInput:DescriptorView = DescriptorView()
    var descriptionInput:DescriptorView = DescriptorView()
    
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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MAIN INIT")
        
        view.backgroundColor = .white
        
        nameInput = DescriptorView(size: CGSize(width: view.frame.size.width - 150, height: 100.0), label: "Name", text: "Micah Smith")
     
        phoneInput = DescriptorView(size: CGSize(width: view.frame.size.width - 150, height: 100.0), label: "Phone", text: "(208) 206-5039")
        
        emailInput = DescriptorView(size: CGSize(width: view.frame.size.width - 150, height: 100.0), label: "Email", text: "micahsmith@gmail.com")
        
        descriptionInput = DescriptorView(size: CGSize(width: view.frame.size.width - 150, height: 100.0), label: "Tell us about yourself", text: "Hi my name is Mica Smith.")
        
        view.addSubview(mainLabel)
        view.addSubview(profilePic)
        view.addSubview(nameInput)
        view.addSubview(phoneInput)
        view.addSubview(emailInput)
        view.addSubview(descriptionInput)
                
        mainLabel.text = "Edit Profile"
                        
        NSLayoutConstraint.activate([
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            
            profilePic.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profilePic.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 30),

            nameInput.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nameInput.topAnchor.constraint(equalTo: profilePic.bottomAnchor, constant: 30),
            
            phoneInput.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            phoneInput.topAnchor.constraint(equalTo: nameInput.bottomAnchor, constant: 30),
            
            emailInput.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emailInput.topAnchor.constraint(equalTo: phoneInput.bottomAnchor, constant: 30),
            
            descriptionInput.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            descriptionInput.topAnchor.constraint(equalTo: emailInput.bottomAnchor, constant: 30)
        ])
        
    }
}

import SwiftUI
struct MainPreviews: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
        .previewLayout(.fixed(width: 317, height: 684))
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        typealias UIViewControllerType = UIViewController
        
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreviews.ContainerView>) -> MainPreviews.ContainerView.UIViewControllerType {
                return MainController()
        }
        
        func updateUIViewController(_ uiViewController: MainPreviews.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreviews.ContainerView>) {
            
        }
    }
}
