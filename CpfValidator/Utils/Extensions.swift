////
////  Extensions.swift
////  CpfValidator
////
////  Created by vitor henrique on 02/09/22.
////
//
//import Foundation
//
//extension Collection where Element == Int {
//
//    var digitoCPF: Int {
//
//        var number = count + 2
//
//        let digit = 11 - reduce(into: 0) { result, cpfDigit in
//
//            number -= 1
//
//            result += cpfDigit * number
//
//        } % 11
//
//        return digit > 9 ? 0 : digit
//    }
//}
//
//extension String {
//
//    var isValidCPF: Bool {
//
//        let numbers = compactMap(\.wholeNumberValue)
//
//        guard numbers.count == 11 && Set(numbers).count != 1 else { return false }
//
//        return numbers.prefix(9).digitoCPF == numbers[9] &&
//
//               numbers.prefix(10).digitoCPF == numbers[10]
//    }
//}
//
//
//
//
//
