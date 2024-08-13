//
//  LogginView.swift
//  EatSideStory
//
//  Created by Apprenant 101 on 19/06/2024.
//

import SwiftUI

// WARNING: CODE PAS OPTIMISE
// WARNING: CODE PAS OPTIMISE
// WARNING: CODE PAS OPTIMISE
// WARNING: CODE PAS OPTIMISE
// WARNING: CODE PAS OPTIMISE

struct RegistrationView:View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var username: String = ""
    @State private var userValid: Bool = false
    @State var userViewModel = UserData()

    var body: some View {
        
        VStack {
            ZStack {
                Image("BackgroundLoggin")
                    .blur(radius: 10)
                VStack {
                    Spacer()
                    Image("AINAOLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 176, height: 127)
                    Spacer().frame(height: 40)
                    ZStack {
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width, height: 700)
                            .foregroundStyle(Theme.color60)
                            .clipShape(RoundedRectangle(cornerRadius: 50))
                        
                        VStack(alignment: .leading) {
                            
                            Text("Pseudo")
                                .padding()
                            
                            TextField("Entrez votre pseudo", text: $username)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Theme.color30, lineWidth: 1)
                                )
                                .padding(.horizontal)
                            
                            Text("Email")
                                .padding()
                            
                            TextField("Entrez votre mail", text: $email)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Theme.color30, lineWidth: 1)
                                )
                                .padding(.horizontal)

                            Text("Password")
                                .padding()
                            
                            SecureField("Entrez votre mot de passe", text: $password)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Theme.color30, lineWidth: 1)
                                )
                                .padding(.horizontal)
                            Button(action: {
                                //
                            }) {
                                Text("Mot de passe oublié ?")
                                    .padding()
                                    .foregroundStyle(Theme.color30)
                                    .underline()
                            }
                            HStack {
                                Spacer()
                                Button(action: {
                                    Task {
                                        userValid = await userViewModel.addRecordAirTable(username: username, mail: email, password: password)
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) {
                                            userValid = false
                                        }
                                    }
                                }) {
                                    Image(systemName: "arrowshape.right.circle")
                                        .resizable()
                                        .frame(width: 75, height: 75)
                                        .foregroundStyle(Theme.color30)
                                }
                                Spacer()
                            }

                            Spacer().frame(height: 125)
                            
                        }
                        .frame(width: UIScreen.main.bounds.width)
                    }
                }
            }
            .sheet(isPresented: $userValid) {
                ModaleLoggingView(isPresented: $userValid, text: "Salut \(username), content de te revoir !")
            }
        }
    }
}



#Preview {
    RegistrationView()
}

