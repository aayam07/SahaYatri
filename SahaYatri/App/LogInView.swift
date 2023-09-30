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
    
        @State private var showPopupMessage = false

        
        var body: some View {
            NavigationView {
                
                ScrollView(showsIndicators: false) {
                    ZStack {
                        VStack(spacing: 16){
                            
                            HStack(spacing: 10) {
                                // TITLE
                                Text("Saha Yatri.")
                                    .font(.system(.largeTitle, design: .rounded, weight: .heavy))
                                    .foregroundColor(.accentColor)
                                    .padding(.leading, 4)
                                
                            } //: HSTACK
//                            .padding()
                            
                            
                            Picker(selection: $isLoggedIn, label: Text("PickerHere")){
                                Text("Login")
                                    .tag(true)
                                Text("Create Account")
                                    .tag(false)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding()
                            
                            if !isLoggedIn{
                                Image(systemName: "figure.run.square.stack.fill")
                                    .font(.system(size: 100))
                                    .foregroundColor(.accentColor)
                            } else {
                                Image(systemName: "figure.run.square.stack")
                                    .font(.system(size: 100))
                                    .foregroundColor(.accentColor)
                            }
                            
                            Group{
                                TextField("Email Addess", text: $email)
                                    .foregroundColor(.accentColor)
                                    .keyboardType(.emailAddress)
                                    .autocapitalization(.none)
                                
                                SecureField("Password", text:$password)
                                    .foregroundColor(.accentColor)
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
//                                        .font(.system(size: 17, weight:.semibold))
                                        .font(.system(.title3, design: .rounded, weight: .heavy))
                                        .padding(.vertical, 9)
                                    Spacer()
                                }
                                .background(Color.accentColor)
                            }
                            
                            Text(loginErrorMessage)
                                .foregroundColor(Color.red)
                            
                        }
                        .navigationTitle(isLoggedIn ? "Login - Saha Yatri" : "Create Account - Saha Yatri.")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar(.hidden)
                        
                    MessageView(show: $showPopupMessage)
                        
                    } //: ZSTACK
                }
                .padding()
//                .foregroundColor(Color.theme.accent)
                .background(Color(.init(white: 0.0, alpha: 0.08)))
                .fullScreenCover(isPresented: $vayo, onDismiss: nil) {
                    withAnimation(.linear(duration: 2)) {
                        HomeView()
                    }
                    
                }
            }  //: NAVIGATION
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
                    
                    // SUCCESSFUL REGISTRATION
                    
                    //print("Successfully registered User : \(result?.user.uid ?? "")")
//                    self.loginErrorMessage = ("Successfully registered User : \(result?.user.uid ?? "")")
                    
                    // Present the success view
                    
                    self.email = ""
                    self.password = ""
                    self.showPopupMessage = true
                    
                    
                }
                
            }
        }
        
        private func login(){
            //Auth.auth().signIn(withEmail: email, password: password){result, error in
            Auth.auth().signIn(withEmail: email, password: password){result, error in
                if let error = error{
                    //print("Failed to login user : \(error)")
//                    self.loginErrorMessage = ("Failed to register user : \(error)")
                    print("Failed to login user : \(error)")
//                    MessageView(message: "Some problem occured. Try again!")
                    return
                }else{
                    
                    // SUCCESSFUL LOG IN
                    
                    //print("Successfully loggedin: \(result?.user.uid ?? "")")
//                    self.loginErrorMessage = ("Successfully loggedIn User : \(result?.user.uid ?? "")")
//                    print("Successfully loggedIn User : \(result?.user.uid ?? "")")
    //                self.didCompleteLoginProcess()
                    
                    self.email = ""
                    self.password = ""
                    
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
