//
//  SuccessViewController.swift
//  CpfValidator
//
//  Created by vitor henrique on 01/09/22.
//

import Foundation
import UIKit

class SuccessViewController: UIViewController {
    
    //MARK: - Properties
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = "Sucesso"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private lazy var rightImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "person")
        image.backgroundColor = .lightGray
        return image
    }()
    
    //MARK: - Initializers

    override func viewDidLoad() {
        configureUI()
    }
    //MARK: - Private methods

    private func configureUI() {
        view.backgroundColor = .green
        addSubViews()
        configureConstraints()
    }
    
    private func addSubViews() {
        view.addSubview(messageLabel)
        view.addSubview(rightImageView)
    }
    
    private func configureConstraints() {
        
    }
}
