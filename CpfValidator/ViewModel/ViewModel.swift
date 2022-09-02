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




// multiplicar os 9 primeiros dígitos pela sequência

//5 * 10 + 2 * 9 + 9 * 8 + 9 * 7 + 8 * 6 + 2 * 5 + 2 * 4 + 4 * 3 + 7 * 2

//Primeiramente multiplica-se os 9 primeiros dígitos pela sequência
//5 * 10 + 2 * 9 + 9 * 8 + 9 * 7 + 8 * 6 + 2 * 5 + 2 * 4 + 4 * 3 + 7 * 2

//Vamos usar como exemplo, um CPF fictício "529.982.247-25".
//
//Validação do primeiro dígito
//Primeiramente multiplica-se os 9 primeiros dígitos pela sequência decrescente de números de 10 à 2 e soma os resultados. Assim:
//
//5 * 10 + 2 * 9 + 9 * 8 + 9 * 7 + 8 * 6 + 2 * 5 + 2 * 4 + 4 * 3 + 7 * 2
//
//O resultado do nosso exemplo é:
//
//295









