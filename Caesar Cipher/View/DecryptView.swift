//
//  DecryptView.swift
//  Caesar Cipher
//
//  Created by Jundana Al-Basyir on 20/09/21.
//

import SwiftUI

struct DecryptView: View {
    @ObservedObject var _DecryptVM = DecryptViewModel()
    
    init() {
        _DecryptVM = DecryptViewModel()
    }
    
    var body: some View {
        ZStack {
            // MARK: DecryptView
            VStack {
                Text("Plaintext")
                    .font(.system(size: 15, weight: .semibold, design: .monospaced))
                    .frame(maxWidth: .infinity, alignment: .leading)
                // MARK: ScrollView
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("\(_DecryptVM.output)")
                            .font(.system(size: 17, weight: .light, design: .monospaced))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .disableAutocorrection(true)
                            .padding()
                            .border(Color.gray.opacity(0.7))
                            .cornerRadius(10)
                            .shadow(radius: 3)
                            .contextMenu {
                                Button(action: {
                                    UIPasteboard.general.string = self._DecryptVM.output
                                }) {
                                    Text("Copy to clipboard")
                                    Image(systemName: "doc.on.doc")
                                }
                            }
                    }
                })
                // MARK: Copy to Clipboard
                if (!_DecryptVM.output.isEmpty) {
                    Button(action: {
                        UIPasteboard.general.string = self._DecryptVM.output
                    }) {
                        Text("Copy to clipboard")
                        Image(systemName: "doc.on.doc")
                    }
                    .foregroundColor(.black)
                    .padding(.vertical)
                }
                // MARK: Input Words
                VStack(alignment: .leading, spacing: 10) {
                    Text("Caesar Chiper")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .semibold, design: .monospaced))
                    
                    TextEditor(text: $_DecryptVM.input)
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
                        Slider(value: $_DecryptVM.slideDecrypt, in: 0...25)
                        Spacer()
                        Text("\(Int(_DecryptVM.slideDecrypt))")
                            .foregroundColor(.black)
                            .font(.system(size: 21, weight: .semibold, design: .monospaced))
                    }
                }
                // MARK: Button  Decrypt
                Button(action: {
                    _DecryptVM.letsDecrypt()
                }, label: {
                    Spacer()
                    Text("Decrypt Your Words")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .bold))
                    Spacer()
                })
                .padding()
                .background(Color(.orange))
                .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Decrypt Words")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DecryptView_Previews: PreviewProvider {
    static var previews: some View {
        DecryptView()
    }
}
