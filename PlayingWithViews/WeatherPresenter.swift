//
//  WeatherPresenter.swift
//  PlayingWithViews
//
//  Created by Ayemere  Odia  on 06/08/2020.
//  Copyright © 2020 Ayemere  Odia . All rights reserved.
//

import UIKit

protocol WeatherPresenter {
    var backgroundColors:[CGColor] { get }
}


class WeatherPresenterImpl: WeatherPresenter {
    
    var backgroundColors: [CGColor]{
//        let startColor = UIColor(red: 250/255, green: 85/255, blue: 56/255, alpha: 1)
//        let endColor = UIColor(red: 250/255, green: 50/255, blue: 82/255, alpha: 1)
        //if(model.isSunny){ return sunnyColors}
        return snowyColors
    }
    
    let sunnyColors:[CGColor] = {
        return [UIColor.sunnyTop.cgColor, UIColor.sunnyBottom.cgColor]
    }()
    
    let snowyColors:[CGColor] = {
        return [UIColor.snowyTop.cgColor, UIColor.snowyBottom.cgColor]
    }()
    
    
}
