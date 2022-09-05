//
//  ViewModel.swift
//  CpfValidator
//
//  Created by vitor henrique on 01/09/22.
//

import Foundation
import UIKit

class ViewModel: ViewModelProtocol {
    
    //MARK: - Public Methods
    
    public func cpfValidator (cpf: String?) -> Bool {
        
        guard let cpf = cpf else {return false}
        
        if isValidNumberOfDigits(with: cpf) && isValidCpf(cpf: cpf)  {return true}
        
        return false
    }
    
    //MARK: - Private Methods
    
    private func isValidNumberOfDigits (with cpf:String) -> Bool {
        if cpf.count == 14 {return true}
        
        return false
    }
    
    private func isValidCpf(cpf: String) -> Bool {
        if validateFirstDigit(cpf: cpf) && validateSecondDigit(cpf: cpf) {return true}
        return false
    }
    
    private func validateFirstDigit (cpf: String) -> Bool {
        
        let cpfdot = removeDotFromText(cpf: cpf)
        
        var resultado: Int = 0
        var value: Int = 11
        
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
        if divisionResult == firstDigit {
            return true
        }
        return false
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
            print ("o resultado acumulado é \(result)")
        }
        print ("o resultado é \(resultado)")
        let multiplyByTen = resultado * 10
        let division = multiplyByTen % 11
        let divisionChecker = checkIfDivisionIsequalToTen(result: division)
        
        let divisionResult = String (divisionChecker)
        let tenthDigit = cpfdot[cpfdot.index(cpfdot.startIndex, offsetBy: 11)]
        
        let firstDigit = String(tenthDigit)
        print ("o resultado da divisão é \(divisionResult)")
        print ("o segundo digito é \(tenthDigit)")
        if divisionResult == firstDigit {
            return true
        }
        return false
    }
    
    
    
    
    func removeDotFromText(cpf: String) -> String {
        let cpf = cpf.replacingOccurrences(of: ".", with: "", options: NSString.CompareOptions.literal, range: nil)
        return cpf
    }
    
    func removeHifenFromText (cpf: String) -> String {
        
        let cpfHifen = cpf.replacingOccurrences(of: "-", with: "", options: NSString.CompareOptions.literal, range: nil)
        return cpfHifen
    }
    
    func getFirstNineDigits (cpf:String) -> String {
        let cpfFiltered = cpf.prefix(9)
        return String(cpfFiltered)
    }
    
    func getFirstTenDigits (cpf:String) -> String {
        let cpfFiltered = cpf.prefix(10)
        return String(cpfFiltered)
    }
    
    func convertStringElement (text: String.Element) -> Int {
        
        let digits = String(text)
        
        let converted = Int(digits) ?? 0
        
        return converted
    }
    
    func checkIfDivisionIsequalToTen(result:Int ) -> Int{
        
        var converted = result
        
        if converted == 10 {
            converted = 0
        }
        return converted
    }
}



