//
//  DecryptViewModel.swift
//  Caesar Cipher
//
//  Created by Jundana Al-Basyir on 20/09/21.
//

import Foundation

class DecryptViewModel: ObservableObject {
    @Published private var decrypt: Decrypt = Decrypt()
    
    var input: String {
        get { decrypt.inputText }
        set { decrypt.inputText = newValue }
    }
    
    var slideDecrypt: Double {
        get { decrypt.slideDecrypt }
        set { decrypt.slideDecrypt = newValue }
    }
    
    var output: String {
        decrypt.outputText
    }
    
    func letsDecrypt() {
        decrypt.decryptText()
    }
}
