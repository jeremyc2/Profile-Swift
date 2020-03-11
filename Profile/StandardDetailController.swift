//
//  StandardDetailController.swift
//  Profile
//
//  Created by Jeremy Ryan Chandler on 3/9/20.
//  Copyright © 2020 Jeremy Chandler. All rights reserved.
//

import UIKit
import LBTATools

class StandardDetailController: UIViewController {
    
    var titleText: String = ""
    var labelText: String = ""
    var placeholderText: String = ""

    lazy var titleLabel: UILabel = {
        let lb:UILabel = UILabel(text: titleText, font: Theme.mainFont.withSize(20), textColor: .black, textAlignment: .center, numberOfLines: 1)
        
        lb.adjustsFontSizeToFitWidth = false
        
        lb.translatesAutoresizingMaskIntoConstraints = false
        
        return lb
    }()
    
    lazy var textView:UITextField = {
        let tf = UITextField(placeholder: placeholderText)
                        
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        return tf
    }()
    
    lazy var updateButton: UIButton = {
        var btn:UIButton = UIButton(title: "Update", titleColor: .white, font: Theme.mainFont.withSize(15), backgroundColor: .black, target: nil, action: nil)
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(titleLabel)
        view.addSubview(textView)
        view.addSubview(updateButton)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            
            textView.widthAnchor.constraint(equalToConstant: view.frame.size.width - 170),
            textView.heightAnchor.constraint(equalToConstant: 75),
            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
 
            updateButton.widthAnchor.constraint(equalToConstant: view.frame.size.width - 170),
            updateButton.heightAnchor.constraint(equalToConstant: 50),
            updateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            updateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150)
        ])
        
    }
    
    init(title: String, label: String, placeholder: String){
        super.init(nibName: nil, bundle: nil)
        titleText = title
        labelText = label
        placeholderText = placeholder

        
    }
            
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

import SwiftUI
struct StandardDetailControllerPreviews: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
        .previewLayout(.fixed(width: 317, height: 684))
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        typealias UIViewControllerType = UIViewController
        
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<StandardDetailControllerPreviews.ContainerView>) -> StandardDetailControllerPreviews.ContainerView.UIViewControllerType {
                return StandardDetailController(title: "What's your phone number?", label: "Your phone number", placeholder: "(801) 472-8755")
        }
        
        func updateUIViewController(_ uiViewController: StandardDetailControllerPreviews.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<StandardDetailControllerPreviews.ContainerView>) {
            
        }
    }
}
