//
//  ViewController.swift
//  CpfValidator
//
//  Created by vitor henrique on 01/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    var delegate: ViewModelProtocol?{
        didSet {
            if delegate == nil {
            fatalError()
            }
        }
    }
    
    //MARK: - Properties
    
    private lazy var viewTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Validador de CPF"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
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
        button.setTitle("Validar", for: .normal)
        button.addTarget(self, action: #selector(presentMessageController), for: .touchUpInside)
        button.layer.cornerRadius = 15
        return button
    }()
    
    //MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureDelegate(vm: ViewModel())
    }
    
    //MARK: - Private methods
    
    private func configureUI() {
        addSubViews()
        configureConstraints()
        userCpfTextField.delegate = self
    }
    
    @objc private func validateCpf () {
        if delegate?.cpfValidator(cpf: userCpfTextField.text) == true {
            userCpfTextField.layer.borderColor = UIColor.blue.cgColor
            userCpfTextField.layer.borderWidth = 1
        }
        
        else {
            userCpfTextField.layer.borderColor = UIColor.red.cgColor
            userCpfTextField.layer.borderWidth = 1
        }
    }
    
    private func addSubViews() {
        view.addSubview(viewTitle)
        view.addSubview(userCpfTextField)
        view.addSubview(registerButton)
    }
    
    @objc private func presentMessageController() {
        
        if delegate?.cpfValidator(cpf: userCpfTextField.text) == true {
            
            Utils.presentAlert(title: "Tudo certo!", message: "cpf cadastrado com sucesso", actionMessage: "ok", controller: self) { acao in
                
                guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "SuccessViewController") else {return}
                
                self.navigationController?.pushViewController(controller, animated: true)
            }
            
        }
    
        else {
            Utils.presentAlert(title: "Encontramos um erro", message: "cpf incorreto", actionMessage: "ok", controller: self) { acao in
                
                guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "ErrorViewController") else {return}
                
                self.navigationController?.pushViewController(controller, animated: true)
            }
            
        }
       
    }
    
    private func configureDelegate (vm: ViewModelProtocol?) {
        self.delegate = vm
    }

    //MARK: - Constraints
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            
            viewTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 30),
            viewTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            viewTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            
            userCpfTextField.topAnchor.constraint(equalTo: viewTitle.bottomAnchor,constant: 20),
            userCpfTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            userCpfTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            
            registerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -40),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
        ])
    }
}

extension ViewController: UITextFieldDelegate {
    
    // validar de todas as formas (colar cpf)
    // pontos ao apagar
    // suc e error mudar
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var appendString = ""
        
        if textField.placeholder == "Digite o seu CPF" {
            
            if range.length == 0 {
                
                switch range.location {
                    
                case 3:
                    appendString = "."
                case 7:
                    appendString = "."
                case 11:
                    appendString = "-"
                    
                default:
                    break
                }
            }
            
            textField.text?.append(appendString)
            
            if (textField.text?.count ?? 0) > 13 && range.length == 0 {
                return false
            }
        }
        return true
    }
}
