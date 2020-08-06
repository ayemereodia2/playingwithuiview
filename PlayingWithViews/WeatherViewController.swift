//
//  WeatherViewController.swift
//  PlayingWithViews
//
//  Created by Ayemere  Odia  on 05/08/2020.
//  Copyright © 2020 Ayemere  Odia . All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    var weatherView :WeatherView { return self.view as! WeatherView }
    
    var presenter:WeatherPresenter!
    
    init(with presenter:WeatherPresenter) {
        super.init(nibName:nil, bundle:nil)
        self.presenter = presenter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateBackground()
    }
    
    override func loadView() {
        self.view = WeatherView(frame: UIScreen.main.bounds)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        let isLandScape = size.width > size.height
        if isLandScape {
            weatherView.centerContentStackView.axis = .horizontal
        }else{
            weatherView.centerContentStackView.axis = .vertical
        }
    }
    
    func updateBackground(){
       
        self.weatherView.updateGradient(presenter.backgroundColors)
    }

}


