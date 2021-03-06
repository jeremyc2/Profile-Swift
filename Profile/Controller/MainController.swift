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

            nameInput.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameInput.topAnchor.constraint(equalTo: profilePic.bottomAnchor, constant: 30),
            nameInput.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100),

            phoneInput.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            phoneInput.topAnchor.constraint(equalTo: nameInput.bottomAnchor, constant: 30),
            phoneInput.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100),

            emailInput.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailInput.topAnchor.constraint(equalTo: phoneInput.bottomAnchor, constant: 30),
            emailInput.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100),

            descriptionInput.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionInput.topAnchor.constraint(equalTo: emailInput.bottomAnchor, constant: 30),
            descriptionInput.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100)
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
