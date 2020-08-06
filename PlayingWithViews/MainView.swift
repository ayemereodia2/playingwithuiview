//
//  MainView.swift
//  PlayingWithViews
//
//  Created by Ayemere  Odia  on 05/08/2020.
//  Copyright © 2020 Ayemere  Odia . All rights reserved.
//

import UIKit

class MainView : UIView {
    var likeAction: (() -> Void)?
    var commentAction: ((String) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUpViews()
        setupConstraints()
        addActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        self.addSubview(contentView)
        self.addSubview(likeButton)
        self.addSubview(commentTextField)
    }
    
    fileprivate func setupContentViewConstraint() {
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        self.contentView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        self.contentView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        self.contentView.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    }
    
    fileprivate func setupTextField(){
        self.commentTextField.translatesAutoresizingMaskIntoConstraints = false
        self.commentTextField.leftAnchor.constraint(equalTo: likeButton.leftAnchor, constant: 0).isActive = true
        self.commentTextField.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 20).isActive = true
        self.commentTextField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -40).isActive = true
        self.commentTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    fileprivate func setupLikeButtonConstraint() {
        self.likeButton.translatesAutoresizingMaskIntoConstraints = false
        self.likeButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        self.likeButton.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10).isActive = true
    }
    
    func setupConstraints(){
        self.translatesAutoresizingMaskIntoConstraints = false
        setupContentViewConstraint()
        setupLikeButtonConstraint()
        setupTextField()
    }
    
    func addActions() {
        self.likeButton.addTarget(self, action: #selector(self.onLikeButtonTapped), for: .touchUpInside)
        self.commentTextField.addTarget(self, action: #selector(self.onCommentTyped), for: .editingChanged)
    }
    
    
    @objc func onLikeButtonTapped(){
        likeAction?()
    }
    
    @objc func onCommentTyped(_ textField: UITextField){
        
        guard let string = textField.text else {
            return 
        }
        commentAction?(string)
    }
    
    let contentView:UIView = {
       let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    let likeButton :UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Like", for:.normal)
        return button
    }()
    
    let commentTextField: UITextField = {
       let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 100, height: 45))
        textField.placeholder = "comment"
        
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 6.0
        return textField
    }()
}
