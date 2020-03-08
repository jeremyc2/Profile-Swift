//
//  MainController.swift
//  Profile
//
//  Created by Jeremy Ryan Chandler on 3/6/20.
//  Copyright © 2020 Jeremy Chandler. All rights reserved.
//

import UIKit

class MainController: UIViewController {
        
    var mainLabel:UILabel = {
        var label:UILabel = UILabel()
        
        label.font = UIFont(name: "KohinoorTelugu-Medium", size: 20)
        label.textColor = UIColor(red: 70/255.0, green: 107/255.0, blue: 217/255.0, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mainLabel)
                
        mainLabel.text = "Edit Profile"
                
        NSLayoutConstraint.activate([
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
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
