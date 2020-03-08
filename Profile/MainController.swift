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
    
    static let themeColor:UIColor = UIColor(red: 70/255.0, green: 107/255.0, blue: 217/255.0, alpha: 1.0)
    static let themeFont:UIFont = UIFont(name: "KohinoorTelugu-Medium", size: 20)!
        
    var mainLabel:UILabel = {
        var label:UILabel = UILabel()
        
        label.font = themeFont
        label.textColor = themeColor
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var profilePic: UIImageView = {
        let diameter = CGFloat(150)
        
        var iv:UIImageView = UIImageView(backgroundColor: .red)
        
        iv.withHeight(diameter)
        iv.withWidth(diameter)
        
        iv.layer.cornerRadius = diameter / 2
        
        iv.layer.borderWidth = 5
        iv.layer.borderColor = themeColor.cgColor
        
                
        return iv
    }()
    
    var nameInput:UITextField = {
        var input: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        input.translatesAutoresizingMaskIntoConstraints = false
        input.text = "Micah Smith"
        input.font = themeFont
        return input
    }()
    
    var phoneInput:UITextField = UITextField()
    var emailInput:UITextField = UITextField()
    var descriptionInput:UITextField = UITextField()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mainLabel)
        view.addSubview(profilePic)
        view.addSubview(nameInput)
        view.addSubview(phoneInput)
        view.addSubview(emailInput)
        view.addSubview(descriptionInput)
                
        mainLabel.text = "Edit Profile"
                        
        NSLayoutConstraint.activate([
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            profilePic.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profilePic.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 30),

            nameInput.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameInput.topAnchor.constraint(equalTo: profilePic.bottomAnchor, constant: 30)
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
