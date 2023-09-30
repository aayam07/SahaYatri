//
//  LogInView.swift
//  SahaYatri
//
//  Created by Aayam Adhikari on 30/09/2023.
//

import SwiftUI
import FirebaseCore
import Firebase

struct LogInView: View {
    
        @State private var isLoggedIn = false
        @State private var email = ""
        @State private var password = ""
        
        @State var loginErrorMessage = ""
        @State var vayo = false
        
        var body: some View {
            NavigationView{
                
                ScrollView{
                    VStack(spacing: 16){
                        Picker(selection: $isLoggedIn, label: Text("PickerHere")){
                            Text("Login")
                                .tag(true)
                            Text("Create Account")
                                .tag(false)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
                        
                        if !isLoggedIn{
                            Button {
                                //profile picture add see chat 03 for it
                            } label: {
                                
                                VStack {
                                    Image(systemName: "person.crop.circle.fill")
                                        .font(.system(size: 100))
                                }
                                .overlay(RoundedRectangle(cornerRadius: 64)
                                    .stroke(Color.black)
                                )
                            }
                        }
                        
                        Group{
                            TextField("Email Addess", text: $email)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                            
                            SecureField("Password", text:$password)
                        }
                        .padding(12)
//                        .background(Color.theme.textFieldColor)
                        
                        Button {
                            handleAction()
                        } label: {
                            HStack{
                                Spacer()
                                Text(isLoggedIn ? "Login": "Create Account")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 17, weight:.semibold))
                                    .padding(.vertical, 9)
                                Spacer()
                            }
                            .background(Color.accentColor)
                        }
                        
                        Text(loginErrorMessage)
                            .foregroundColor(Color.red)
                        
                    }
                    .navigationTitle(isLoggedIn ? "Login" : "Create Account")
                }
                .padding()
//                .foregroundColor(Color.theme.accent)
                .background(Color(.init(white: 0.0, alpha: 0.08)))
                .fullScreenCover(isPresented: $vayo, onDismiss: nil) {
                    withAnimation(.linear(duration: 2)) {
                        HomeView()
                    }
                    
                }
            }
        }
    
        private func handleAction(){
            if isLoggedIn{
                login()
                
            }else{
                register()
            }
        }
        
        
        private func register(){
            Auth.auth().createUser(withEmail: email, password: password){ result, error in
                if let safeError = error{
                    //print("Failed to register user : \(error)")
                    self.loginErrorMessage = ("Failed to register user : \(safeError)")
                    return
                }else{
                    //print("Successfully registered User : \(result?.user.uid ?? "")")
                    self.loginErrorMessage = ("Successfully registered User : \(result?.user.uid ?? "")")
                }
                
            }
        }
        
        private func login(){
            //Auth.auth().signIn(withEmail: email, password: password){result, error in
            Auth.auth().signIn(withEmail: email, password: password){result, error in
                if let error = error{
                    //print("Failed to login user : \(error)")
                    self.loginErrorMessage = ("Failed to register user : \(error)")
                    return
                }else{
                    //print("Successfully loggedin: \(result?.user.uid ?? "")")
                    self.loginErrorMessage = ("Successfully loggedIn User : \(result?.user.uid ?? "")")
    //                self.didCompleteLoginProcess()
                    self.vayo.toggle()
                }
            }
        }
        
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
