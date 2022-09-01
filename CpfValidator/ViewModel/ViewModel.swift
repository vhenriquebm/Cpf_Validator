//
//  ViewModel.swift
//  CpfValidator
//
//  Created by vitor henrique on 01/09/22.
//

import UIKit

let mask = "###.###.###-##"

struct ViewModel: ViewModelProtocol {
    
    //MARK: - Public Methods
    
    public func cpfValidator (cpf: String?) -> Bool {
        
    guard let cpf = cpf, let cpfConverted = Int(cpf) else {return false}
        
        if isValidNumberOfDigits(with: cpf) {return true}
        
        if isValidCpf(cpf: cpfConverted) {return true}
        
        if cpf.isCPF {return true}
        
        return false
    }
    
    //MARK: - Public Methods
    
    private func isValidNumberOfDigits (with cpf:String) -> Bool {
        if cpf.count == 11 {return true}
        return false
    }
    
    private func isValidCpf(cpf: Int) -> Bool {
        
        

        
        
        
        //Vamos usar como exemplo, um CPF fictício "529.982.247-25".

        //Primeiramente multiplica-se os 9 primeiros dígitos pela sequência
        //5 * 10 + 2 * 9 + 9 * 8 + 9 * 7 + 8 * 6 + 2 * 5 + 2 * 4 + 4 * 3 + 7 * 2

        
        return false
    }
}







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

extension String {

    var isCPF: Bool {
        
        let cpf = self.onlyNumbers()
        guard cpf.count == 11 else { return false }

        let i1 = cpf.index(cpf.startIndex, offsetBy: 9)
        let i2 = cpf.index(cpf.startIndex, offsetBy: 10)
        let i3 = cpf.index(cpf.startIndex, offsetBy: 11)
        let d1 = Int(cpf[i1..<i2])
        let d2 = Int(cpf[i2..<i3])

        var temp1 = 0, temp2 = 0

        for i in 0...8 {
            let start = cpf.index(cpf.startIndex, offsetBy: i)
            let end = cpf.index(cpf.startIndex, offsetBy: i+1)
            let char = Int(cpf[start..<end])

            temp1 += char! * (10 - i)
            temp2 += char! * (11 - i)
        }

        temp1 %= 11
        temp1 = temp1 < 2 ? 0 : 11-temp1

        temp2 += temp1 * 2
        temp2 %= 11
        temp2 = temp2 < 2 ? 0 : 11-temp2

        return temp1 == d1 && temp2 == d2
    }

    func onlyNumbers() -> String {
        guard !isEmpty else { return "" }
        return replacingOccurrences(of: "\\D",
                                    with: "",
                                    options: .regularExpression,
                                    range: startIndex..<endIndex)
    }

}
