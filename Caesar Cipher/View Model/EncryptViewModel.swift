//
//  EncryptViewModel.swift
//  Caesar Cipher
//
//  Created by Jundana Al-Basyir on 20/09/21.
//

import Foundation

class EncryptViewModel: ObservableObject {
    @Published private var encrypt: Encrypt = Encrypt()
    
    var input: String {
        get { encrypt.inputText }
        set { encrypt.inputText = newValue }
    }
    
    var slideEncrypt: Double {
        get { encrypt.slideEncrypt }
        set { encrypt.slideEncrypt = newValue }
    }
    
    var output: String {
        encrypt.outputText
    }
    
    func letsEncrypt() {
        encrypt.encryptText()
    }
}
