//
//  MessageController.swift
//  CpfValidator
//
//  Created by vitor henrique on 01/09/22.
//

import UIKit

class ErrorViewController: UIViewController {
    
    //MARK: - Properties
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = "Sucesso"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    
    //MARK: - Initializers
    
    override func viewDidLoad() {
        configureUI()
    }
    
    //MARK: - Private methods

    private func configureUI() {
        view.backgroundColor = .green
    }
    
    private func configureConstraints() {
        
        
    }
    
    
}
