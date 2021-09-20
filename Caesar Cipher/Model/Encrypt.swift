//
//  Encrypt.swift
//  Caesar Cipher
//
//  Created by Jundana Al-Basyir on 20/09/21.
//

import Foundation

struct Encrypt {
    var inputText: String = ""
    var outputText: String = ""
    var slideEncrypt: Double = 0
    
    mutating func encryptText() {
        outputText.removeAll()

        let input = inputText.components(separatedBy: .whitespacesAndNewlines).joined().uppercased()
        let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let slideAlphabet = String(alphabet.dropFirst(Int(slideEncrypt))) + String(alphabet.dropLast(alphabet.count - Int(slideEncrypt)))
        
        for i in input {
            let range: Range<String.Index> = alphabet.range(of: String(i))!
            let index: Int = slideAlphabet.distance(from: slideAlphabet.startIndex, to: range.lowerBound)
            let index2 = alphabet.index(alphabet.startIndex, offsetBy: index)
            let encrypted: Character = slideAlphabet[index2]

            outputText.append(encrypted)
        }
    }
}
