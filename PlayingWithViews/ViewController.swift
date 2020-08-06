//
//  ViewController.swift
//  PlayingWithViews
//
//  Created by Ayemere  Odia  on 18/07/2020.
//  Copyright © 2020 Ayemere  Odia . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var mainView:MainView { return self.view as! MainView }
    var liked = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.commentAction = { text in
            
            print("\(text)")
        }
        
        mainView.likeAction = {[weak self] in self?.likeAction()                        }
    }
    
    
    private func likeAction(){
        self.liked = !self.liked
                  if self.liked {
                      self.mainView.likeButton.setTitle("DisLike", for: .normal)
                      UIView.animate(withDuration: 0.5, animations: {
                           self.mainView.contentView.backgroundColor = UIColor.red.withAlphaComponent(0.5)
                      })
                  }else{
                      self.mainView.likeButton.setTitle("Like", for: .normal)
                      UIView.animate(withDuration: 0.5, animations: {
                          self.mainView.contentView.backgroundColor = .clear
                      })
                  }
    }
    override func loadView() {
        self.view = MainView(frame: UIScreen.main.bounds)
    }

}



