//
//  ViewModel.swift
//  CpfValidator
//
//  Created by vitor henrique on 01/09/22.
//

import UIKit

struct ViewModel: ViewModelProtocol {
    
    //MARK: - Public Methods
    
    public func cpfValidator (cpf: String?) -> Bool {
        
        guard let cpf = cpf else {return false}

        if cpf.count == 11 {
            return true
        }

        return false
    }
}


extension String {
    
    var isCPF: Bool {
        let cpf = self.onlyNumbers()

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
