//
//  ViewModel.swift
//  CpfValidator
//
//  Created by vitor henrique on 01/09/22.
//

import Foundation

struct ViewModel: ViewModelProtocol {
    
    //MARK: - Public Methods
    
    public func cpfValidator (cpf: String?) -> Bool {
        
        guard let cpf = cpf else {return false}
        
        if isValidNumberOfDigits(with: cpf) && isValidCpf(cpf: cpf)  {return true}
        
        return false
    }
    
    //MARK: - Private Methods
    
    private func isValidNumberOfDigits (with cpf:String) -> Bool {
        if cpf.count == 14 {return true}
        if cpf.isValidCPF {return true}
        return false
    }
    
    private func isValidCpf(cpf: String) -> Bool {
        if cpf.isValidCPF {return true}
        return false
    }
}





















