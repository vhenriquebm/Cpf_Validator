//
//  ViewModel.swift
//  CpfValidator
//
//  Created by vitor henrique on 01/09/22.
//

import Foundation

class ViewModel: ViewModelProtocol {
    
    //MARK: - Public Methods
    
    public func validateCpf (cpf: String?) -> Bool {
        guard let cpf = cpf else {return false}
        
        return isValidNumberOfDigits(with: cpf) && isValidCpf(cpf: cpf)
    }
    
    //MARK: - Private Methods
    
    private func isValidNumberOfDigits (with cpf:String) -> Bool {
         return cpf.count == 14
    }
    
    private func isValidCpf(cpf: String) -> Bool {
        return validateFirstDigit(cpf: cpf) && validateSecondDigit(cpf: cpf)
    }
    
    private func validateFirstDigit (cpf: String) -> Bool {
        var resultado: Int = 0
        var value: Int = 11
        
        let cpfdot = removeDotFromText(cpf: cpf)
        let cpfHifen = removeHifenFromText(cpf: cpfdot)
        
        guard cpfHifen.count == 11 && Set(cpfHifen).count != 1 else { return false }
        
        let cpfFiltered = getFirstNineDigits(cpf: cpfdot)
        
        for digit in cpfFiltered {
            
            value -= 1
            
            let converted = convertStringElement(text: digit)
            
            let result =  value * converted
            
            resultado += result
        }
        
        let multiplyByTen = resultado * 10
        let division = multiplyByTen % 11
        let divisionChecker = checkIfDivisionIsequalToTen(result: division)
        
        let divisionResult = String (divisionChecker)
        let ninethDigit = cpfdot[cpfdot.index(cpfdot.startIndex, offsetBy: 10)]
        
        let firstDigit = String(ninethDigit)
        print ("o resultado da divisão é \(divisionResult)")
        print ("o primeiro digito é é \(ninethDigit)")
        return divisionResult == firstDigit
    }
    
    private func validateSecondDigit (cpf: String) -> Bool {
        
        let cpfdot = removeDotFromText(cpf: cpf)
        let cpfHifen = removeHifenFromText(cpf: cpfdot)
        
        var resultado: Int = 0
        var value: Int = 12
        
        let cpfFiltered = getFirstTenDigits(cpf: cpfHifen)
        
        print ("cpf filtrado é \(cpfFiltered)")
        for digit in cpfFiltered {
            
            value -= 1
            
            let converted = convertStringElement(text: digit)
            
            let result =  value * converted
            
            resultado += result
        }
        
        let multiplyByTen = resultado * 10
        let division = multiplyByTen % 11
        let divisionChecker = checkIfDivisionIsequalToTen(result: division)
        
        let divisionResult = String (divisionChecker)
        let tenthDigit = cpfdot[cpfdot.index(cpfdot.startIndex, offsetBy: 11)]
        
        let firstDigit = String(tenthDigit)
        print ("o resultado da divisão é \(divisionResult)")
        print ("o segundo digito é \(tenthDigit)")
        return divisionResult == firstDigit
    }
    
    private func removeDotFromText(cpf: String) -> String {
       return cpf.replacingOccurrences(of: ".", with: "", options: NSString.CompareOptions.literal, range: nil)
    }
    
    private func removeHifenFromText (cpf: String) -> String {
        return cpf.replacingOccurrences(of: "-", with: "", options: NSString.CompareOptions.literal, range: nil)
    }
    
    private func getFirstNineDigits (cpf:String) -> String {
        let cpfFiltered = cpf.prefix(9)
        return String(cpfFiltered)
    }
    
    private func getFirstTenDigits (cpf:String) -> String {
        let cpfFiltered = cpf.prefix(10)
        return String(cpfFiltered)
    }
    
    private func convertStringElement (text: String.Element) -> Int {
        let digits = String(text)
        let converted = Int(digits) ?? 0
        return converted
    }
    
    private func checkIfDivisionIsequalToTen(result:Int ) -> Int{
        var converted = result
        if converted == 10 {
            converted = 0
        }
        return converted
    }
}




