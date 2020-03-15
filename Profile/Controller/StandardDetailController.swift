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
    var inputText: String = ""
    
    var tapGesture = UITapGestureRecognizer()
    
    @objc func dismissByTap(_ sender: UITapGestureRecognizer? = nil) {
        dismiss(animated: false, completion: nil)

    }
    
    lazy var arrowGraphic:UIView = {
        var v:UIView = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
                
        let arrow = UIBezierPath()
        
        let a:CGPoint = CGPoint(x: 7.5, y: 0.0)
        let b:CGPoint = CGPoint(x: 0.0, y: 7.5)
        let c:CGPoint = CGPoint(x: 7.5, y: 15.0)
        let d:CGPoint = CGPoint(x: 15.0, y: 7.5)
        
        arrow.move(to: a)
        arrow.addLine(to: b)
        arrow.addLine(to: c)
        arrow.move(to: b)
        arrow.addLine(to: d)

        let arrowLayer = CAShapeLayer()
        arrowLayer.strokeColor = UIColor.black.cgColor
        arrowLayer.lineWidth = 2
        arrowLayer.path = arrow.cgPath
        arrowLayer.fillColor = UIColor.clear.cgColor
        arrowLayer.lineJoin = CAShapeLayerLineJoin.round
        arrowLayer.lineCap = CAShapeLayerLineCap.round
        
        v.layer.addSublayer(arrowLayer)

        
        return v
        
    }()

    lazy var titleLabel: UILabel = {
        let lb:UILabel = UILabel(text: titleText, font: Theme.mainFont.withSize(20), textColor: .black, textAlignment: .center, numberOfLines: 1)
        
        lb.adjustsFontSizeToFitWidth = false
        
        lb.translatesAutoresizingMaskIntoConstraints = false
        
        return lb
    }()
    
    lazy var textViewLabel: UILabel = {
        let lb:UILabel = UILabel(text: labelText, font: Theme.mainFont.withSize(20), textColor: .gray, textAlignment: .center, numberOfLines: 1)
        
        lb.adjustsFontSizeToFitWidth = false
        
        lb.translatesAutoresizingMaskIntoConstraints = false
        
        return lb
    }()
    
    lazy var textView:UITextField = {
        let tf = UITextField()
        
        tf.text = inputText
                        
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        return tf
    }()
    
    lazy var updateButton: UIButton = {
        var btn:UIButton = UIButton(title: "Update", titleColor: .white, font: Theme.mainFont.withSize(15), backgroundColor: .black, target: nil, action: nil)
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    lazy var customTextEdit:UIView = {
        
        var vw:UIView = UIView()
        
        vw.translatesAutoresizingMaskIntoConstraints = false
        
        vw.layer.borderColor = UIColor.gray.cgColor
        vw.layer.borderWidth = 1
                
        var stack:UIStackView = UIStackView()

        stack.translatesAutoresizingMaskIntoConstraints = false

        stack.axis = .vertical
        stack.alignment = .leading
        
        stack.padTop(4.0)
        stack.padLeft(4.0)
        stack.padRight(4.0)

        stack.addArrangedSubview(textViewLabel)
        stack.addArrangedSubview(textView)

        vw.addSubview(stack)
        
        return vw

    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissByTap(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        arrowGraphic.addGestureRecognizer(tapGesture)
        arrowGraphic.isUserInteractionEnabled = true
        
        view.backgroundColor = .white
        
        view.addSubview(arrowGraphic)
        view.addSubview(titleLabel)
        view.addSubview(customTextEdit)
        view.addSubview(updateButton)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            
            customTextEdit.widthAnchor.constraint(equalToConstant: view.frame.size.width - 170),
            customTextEdit.heightAnchor.constraint(equalToConstant: 55),
            customTextEdit.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customTextEdit.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
 
            updateButton.widthAnchor.constraint(equalToConstant: view.frame.size.width - 170),
            updateButton.heightAnchor.constraint(equalToConstant: 50),
            updateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            updateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            
            arrowGraphic.heightAnchor.constraint(equalToConstant: 15.0),
            arrowGraphic.widthAnchor.constraint(equalToConstant: 15.0),
            arrowGraphic.topAnchor.constraint(equalTo: view.topAnchor, constant: 50.0),
            arrowGraphic.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0)
        ])
        
    }
    
    init(title: String, label: String, text: String){
        super.init(nibName: nil, bundle: nil)
        titleText = title
        labelText = label
        inputText = text

        
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
                return StandardDetailController(title: "What's your phone number?", label: "Your phone number", text: "(801) 472-8755")
        }
        
        func updateUIViewController(_ uiViewController: StandardDetailControllerPreviews.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<StandardDetailControllerPreviews.ContainerView>) {
            
        }
    }
}
