//
//  WeatherView.swift
//  PlayingWithViews
//
//  Created by Ayemere  Odia  on 06/08/2020.
//  Copyright © 2020 Ayemere  Odia . All rights reserved.
//

import UIKit

class WeatherView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        setupViews()
        addConstraints()
    }
    
    private func setupViews(){
        //self.addSubview(backgroundView)
        self.addSubview(mainStack)
        conditionImageStackView.addArrangedSubview(conditionImageView)
        mainStack.addArrangedSubview(conditionImageStackView)        
        mainStack.addArrangedSubview(centerContentStackView)
        
        centerContentStackView.addArrangedSubview(temperatureLabel)
        centerContentStackView.addArrangedSubview(cityAndConditonsStackView)

        cityAndConditonsStackView.addArrangedSubview(cityNameLabel)
        cityAndConditonsStackView.addArrangedSubview(conditionsNameLabel)

        mainStack.addArrangedSubview(buttonStack)
        buttonStack.addArrangedSubview(UIView(frame: .zero))
        buttonStack.addArrangedSubview(celciusButton)
        buttonStack.addArrangedSubview(fahrenheit)
        buttonStack.addArrangedSubview(UIView(frame: .zero))

    }
    
    private func addConstraints() {
        //backgroundView.pinEdges(to: self)
        mainStack.pinEdgesToSafeArea(of: self)
    }
    
    // MARK: - Views
    
    let backgroundView:UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .red
        return view
    }()
    
    let mainStack:UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 30, bottom: 30, right: 30)
        stackView.spacing = 10
        return stackView
    }()
    
    let cityAndConditonsStackView:UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        return stackView
    }()
    
    let centerContentStackView:UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 60
        stackView.alignment = .center
        return stackView
    }()
    
    let conditionImageStackView:UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.alignment = .trailing
        return stackView
    }()
    
    let temperatureLabel:UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 144)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "18º"
        return label
    }()
    
    let cityNameLabel:UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 36)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Christchurch"
        return label
    }()
    
    let conditionsNameLabel:UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Sunny"
        return label
    }()
    
    let conditionImageView:UIImageView = {
        let image = UIImage(named: "sun")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: image!.size.width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: image!.size.height).isActive = true
        return imageView
    }()
    
    let celciusButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("°C", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 73)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
     let fahrenheit:UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 73)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("°F", for: .normal)
        return button
    }()
    
    let buttonStack:UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.spacing = 10
        return stackView
    }()
}

extension WeatherView {
    var gradientLayer:CAGradientLayer {
        return self.layer as! CAGradientLayer
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }
    
    func updateGradient(_ colors: [CGColor]){
        gradientLayer.colors = colors
    }
}
