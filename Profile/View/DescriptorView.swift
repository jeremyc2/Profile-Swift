//
//  DescriptorView.swift
//  Profile
//
//  Created by Jeremy Ryan Chandler on 3/8/20.
//  Copyright © 2020 Jeremy Chandler. All rights reserved.
//

import UIKit
import LBTATools



class DescriptorView: UIView {
    // We use lazy properties for each view
    lazy var stackView:UIStackView = UIStackView()
    
    lazy var arrowGraphic:UIView = {
        var v:UIView = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        
        
        let arrow = UIBezierPath()
        
        let a:CGPoint = CGPoint(x: 10.0, y: 10.0)
        let b:CGPoint = CGPoint(x: 20.0, y: 20.0)
        let c:CGPoint = CGPoint(x: 10.0, y: 30.0)
        
        arrow.move(to: a)
        arrow.addLine(to: b)
        arrow.addLine(to: c)

        let arrowLayer = CAShapeLayer()
        arrowLayer.strokeColor = UIColor.gray.cgColor
        arrowLayer.lineWidth = 2
        arrowLayer.path = arrow.cgPath
        arrowLayer.fillColor = UIColor.clear.cgColor
        arrowLayer.lineJoin = CAShapeLayerLineJoin.round
        arrowLayer.lineCap = CAShapeLayerLineCap.round
        
        v.layer.addSublayer(arrowLayer)
        
        return v
        
    }()
    
    var height:CGFloat = 0.0
    var width:CGFloat = 0.0
    
    private func buildStackView(label: String, text: String) {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .horizontal

        stackView.axis = .vertical
        stackView.alignment = .leading
        
        let UILabel1 = UILabel(text: label, font: Theme.mainFont.withSize(15), textColor: Theme.grayColor, textAlignment: .left, numberOfLines: 1)
        let UILabel2 = UILabel(text: text, font: Theme.mainFont.withSize(15), textColor: .black, textAlignment: .left, numberOfLines: 3)
        
        stackView.addArrangedSubview(UILabel1)
        stackView.addArrangedSubview(UILabel2)

    }
    
    func addBottomBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        border.frame = CGRect(x: 0, y: frame.size.height - borderWidth - 3, width: frame.size.width, height: borderWidth)
        addSubview(border)
    }
    
    init(size: CGSize, label: String, text: String) {
        super.init(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: size))
        
        self.height = size.height
        self.width = size.width
        
        self.translatesAutoresizingMaskIntoConstraints = false
        buildStackView(label: label, text: text)
        setupView()
    }
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        
        addSubview(stackView)
        addSubview(arrowGraphic)
        
        addBottomBorder(with: Theme.grayColor, andWidth: 1.0)

        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(lessThanOrEqualTo: heightAnchor),
            stackView.widthAnchor.constraint(equalToConstant: self.width),
            
            arrowGraphic.topAnchor.constraint(equalTo: topAnchor),
            arrowGraphic.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0)
        ])
    }
}



import SwiftUI

var height:CGFloat = 75.0
var width:CGFloat = 200.0

struct DVPreviews: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
        .previewLayout(.fixed(width: width, height: height))
    }
    
    struct ContainerView: UIViewRepresentable {
        
        typealias UIViewType = DescriptorView
        
        func makeUIView(context: UIViewRepresentableContext<DVPreviews.ContainerView>) -> DescriptorView {
            DescriptorView(size: CGSize(width: width, height: height), label: "Hello World", text: "This is text")
        }
        
        func updateUIView(_ uiView: DescriptorView, context: UIViewRepresentableContext<DVPreviews.ContainerView>) {
            
        }
    }
}



