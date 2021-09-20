//
//  Decrypt.swift
//  Caesar Cipher
//
//  Created by Jundana Al-Basyir on 20/09/21.
//

import Foundation

struct Decrypt {
    var inputText: String = ""
    var outputText: String = ""
    var slideDecrypt: Double = 0
    
    mutating func decryptText() {
        outputText.removeAll()
        
        let input = inputText.components(separatedBy: .whitespacesAndNewlines).joined().uppercased()
        let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let slideAlphabet = String(alphabet.dropFirst(Int(slideDecrypt))) + String(alphabet.dropLast(alphabet.count - Int(slideDecrypt)))
        
        for i in input {
            let range: Range<String.Index> = slideAlphabet.range(of: String(i))!
            let index: Int = alphabet.distance(from: slideAlphabet.startIndex, to: range.lowerBound)
            let index2 = slideAlphabet.index(slideAlphabet.startIndex, offsetBy: index)
            let decrypted: Character = alphabet[index2]
            
            outputText.append(decrypted)
        }
    }
}
