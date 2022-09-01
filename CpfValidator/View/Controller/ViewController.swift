//
//  ViewController.swift
//  CpfValidator
//
//  Created by vitor henrique on 01/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel = ViewModel()
    var delegate: ViewModelProtocol?
    
    //MARK: - Properties
    
    private lazy var userCpfTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.addTarget(self, action: #selector(validateCpf), for: .editingChanged)
        tf.borderStyle = .roundedRect
        tf.placeholder = "Digite o seu CPF"
        tf.keyboardType = .numberPad
        return tf
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.setTitleColor(.white, for:.normal)
        button.setTitle("Registrar", for: .normal)
        button.addTarget(self, action: #selector(presentMessageController), for: .touchUpInside)
        return button
    }()
    
    
    //MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        self.delegate = viewModel
        
    }
    
    //MARK: - Private methods
    
    private func configureUI() {
        addSubViews()
        configureConstraints()
        
    }
    
    @objc private func validateCpf () {

        if viewModel.cpfValidator(cpf: userCpfTextField.text) == true {
            userCpfTextField.layer.borderColor = UIColor.blue.cgColor
            userCpfTextField.layer.borderWidth = 1
        }
        
        else {
            userCpfTextField.layer.borderColor = UIColor.red.cgColor
            userCpfTextField.layer.borderWidth = 1
        }
    }
    
    private func addSubViews() {
        view.addSubview(userCpfTextField)
        view.addSubview(registerButton)
    }
    
    @objc private func presentMessageController() {
        let controller = SuccessViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: - Constraints
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            userCpfTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 30),
            userCpfTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            userCpfTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            
            registerButton.topAnchor.constraint(equalTo: userCpfTextField.bottomAnchor,constant: 20),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
        ])
    }
    
   
}


