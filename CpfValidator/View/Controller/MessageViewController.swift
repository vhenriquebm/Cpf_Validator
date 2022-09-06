//
//  SuccessViewController.swift
//  CpfValidator
//
//  Created by vitor henrique on 01/09/22.
//

import Foundation
import UIKit

class MessageViewController: UIViewController {
    
    //MARK: - Properties
    
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sucesso"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 60, weight: .bold)
        label.textAlignment =  .center
        return label
    }()
    
    lazy var messageImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "check")
        image.contentMode = .scaleToFill
        return image
    }()
    
    //MARK: - Initializers
    
    override func viewDidLoad() {
        configureUI()
    }
    //MARK: - Private methods
    
    private func configureUI() {
        view.backgroundColor = .systemGreen
        addSubViews()
        configureConstraints()
    }
    
    private func addSubViews() {
        view.addSubview(messageLabel)
        view.addSubview(messageImageView)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            
            messageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            
            messageLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            
            messageLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            
            messageImageView.topAnchor.constraint(equalTo: messageLabel.bottomAnchor,constant: 20),
            
            messageImageView.heightAnchor.constraint(equalToConstant: 100),
            
            messageImageView.widthAnchor.constraint(equalToConstant: 100),
            
            messageImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
