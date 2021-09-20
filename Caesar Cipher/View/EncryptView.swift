//
//  EncryptView.swift
//  Caesar Cipher
//
//  Created by Jundana Al-Basyir on 20/09/21.
//

import SwiftUI

struct EncryptView: View {
    @ObservedObject var _EncryptVM = EncryptViewModel()
    
    init() {
        _EncryptVM = EncryptViewModel()
    }
    
    var body: some View {
        ZStack {
            // MARK: EncryptView
            VStack {
                Text("Caesar Chiper")
                    .font(.system(size: 15, weight: .semibold, design: .monospaced))
                    .frame(maxWidth: .infinity, alignment: .leading)
                // MARK: ScrollView
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("\(_EncryptVM.output)")
                            .font(.system(size: 17, weight: .light, design: .monospaced))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .disableAutocorrection(true)
                            .padding()
                            .border(Color.gray.opacity(0.7))
                            .cornerRadius(10)
                            .shadow(radius: 3)
                    }
                })
                // MARK: Copy to Clipboard
                if (!_EncryptVM.output.isEmpty) {
                    Button(action: {
                        UIPasteboard.general.string = self._EncryptVM.output
                    }) {
                        Text("Copy to clipboard")
                        Image(systemName: "doc.on.doc")
                    }
                    .foregroundColor(.black)
                    .padding(.vertical)
                }
                // MARK: Input Words
                VStack(alignment: .leading, spacing: 10) {
                    Text("Plaintext")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .semibold, design: .monospaced))
                    
                    TextEditor(text: $_EncryptVM.input)
                        .font(.system(size: 13, weight: .semibold, design: .monospaced))
                        .frame(width: .infinity)
                        .disableAutocorrection(true)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                }
                // MARK: Alphabet Slide Key
                VStack(alignment: .leading, spacing: 10) {
                    Text("Shift By")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .semibold, design: .monospaced))
                    
                    HStack {
                        Slider(value: $_EncryptVM.slideEncrypt, in: 0...25)
                        Spacer()
                        Text("\(Int(_EncryptVM.slideEncrypt))")
                            .foregroundColor(.black)
                            .font(.system(size: 21, weight: .semibold, design: .monospaced))
                    }
                }
                // MARK: Button  Encrypt
                Button(action: {
                    _EncryptVM.letsEncrypt()
                }, label: {
                    Spacer()
                    Text("Encrypt Your Words")
                        .foregroundColor(.black)
                        .font(.system(size: 17, weight: .semibold))
                    Spacer()
                })
                .padding()
                .background(Color(.green))
                .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Encrypt Words")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct EncryptView_Previews: PreviewProvider {
    static var previews: some View {
        EncryptView()
    }
}
