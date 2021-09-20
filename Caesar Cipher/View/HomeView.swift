//
//  HomeView.swift
//  Caesar Cipher
//
//  Created by Jundana Al-Basyir on 20/09/21.
//

import SwiftUI

struct HomeView: View {
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.black).edgesIgnoringSafeArea(.all)
                // MARK: ScrollView
                ScrollView(.vertical) {
                    VStack(spacing: 10) {
                        // MARK: Encrypt Words
                        NavigationLink(
                            destination: Text("Encrypt Words"),
                            label: {
                                VStack {
                                    Image(systemName: "lock.circle")
                                        .resizable()
                                        .frame(width: 45, height: 45)
                                    
                                    Text("Encrypt Words")
                                        .padding()
                                        .font(.system(size: 17, weight: .bold, design: .monospaced))
                                }
                                .frame(height: 285)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .background(Color(.purple))
                                .cornerRadius(10)
                            }
                        )
                        // MARK: Decrypt Words
                        NavigationLink(
                            destination: Text("Decrypt Words"),
                            label: {
                                VStack {
                                    Image(systemName: "lock.rotation.open")
                                        .resizable()
                                        .frame(width: 45, height: 45)
                                    
                                    Text("Decrypt Words")
                                        .padding()
                                        .font(.system(size: 17, weight: .bold, design: .monospaced))
                                }
                                .frame(height: 285)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .background(Color(.orange))
                                .cornerRadius(10)
                            }
                        )
                        // MARK: FOOTER
                        HStack {
                            Text("Made with")
                                .foregroundColor(.white)
                            
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                            
                            Text("by Jundana")
                                .foregroundColor(.white)
                        }
                        .font(.system(size: 13, weight: .semibold))
                    }
                    .padding()
                    .navigationTitle("Caesar Cipher")
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
