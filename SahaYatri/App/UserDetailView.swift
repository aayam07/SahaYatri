//
//  UserDetailView.swift
//  SahaYatri
//
//  Created by Aayam Adhikari on 30/09/2023.
//

import SwiftUI
import Firebase

struct UserDetailView: View {
    //MARK: - PRPOERTY
    @AppStorage("onBoarding") var isOnboardingViewActive: Bool = false
    
    //MARK: - BODY
    var body: some View {
        NavigationStack {
            ZStack {
                
                VStack {
                    //MARK: - HEADER
                    
                    HStack(spacing: 10) {
                        // TITLE
                        Text("Saha Yatri.")
                            .font(.system(.largeTitle, design: .rounded, weight: .heavy))
                            .foregroundColor(.accentColor)
                            .padding(.leading, 4)
                        
                        Spacer()
                        
                        // LogOut BUTTON
                        Button {
                            // Logout action
                            do {
                                try Auth.auth().signOut()
                                
                                // Show start page when user logs out
                                isOnboardingViewActive = true
                                
                                
                            } catch let signOutError as NSError {
                                print("Error signing out: %@", signOutError)
                            }
                        } label: {
                            Text("Log Out")
                                .font(.system(size: 16, weight: .semibold, design: .rounded))
                                .foregroundColor(.white)
                                .padding(.horizontal, 10)
                                .frame(minWidth: 70, minHeight: 24)
                                .background(
                                    Capsule()
                                        .fill(Color.accentColor)
//                                        .stroke(Color.white, lineWidth: 2)
                                )
                        }
                        
                    } //: HSTACK
                    .padding()
                    .foregroundColor(.black)
                    
                    Spacer(minLength: 80)
                    
                    GroupBox {
                        
                    }
                }
            } //: ZSTACK
        }  //: NAVIGATION
    }
}

//MARK: - PREVIEW
struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView()
    }
}
