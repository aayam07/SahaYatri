//
//  StartView.swift
//  SahaYatri
//
//  Created by Aayam Adhikari on 29/09/2023.
//

import SwiftUI

struct StartView: View {
    //MARK: - PROPERTY
    @AppStorage("onBoarding") var isOnboardingViewActive: Bool = true
    @State private var isAnimating: Bool = false
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20) {
                //MARK: - HEADER
                
                Spacer()
                
                VStack(spacing: 0) {
                    
                    Text("Saha Yatri.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    // Multiline texts using """
                    Text("Travel. Fast. Safe.")
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                    
                } //: HEADER
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
                //MARK: - CENTER
                
                ZStack {
                    
                    CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
                        
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        
                    
                    
                } //: CENTER
                
                
                Spacer()
                
                //MARK: - FOOTER
                
                Button {
                    isOnboardingViewActive = false
                } label: {
                    HStack(spacing: 8) {
                        Text("Start")
                        
                        Image(systemName: "arrow.right.circle")
                            .imageScale(.large)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(
                        Capsule()
                            .strokeBorder(Color.white, lineWidth: 1.25)
                    )
                }  //: BUTTON
                .padding(.bottom, 30)
                .accentColor(Color.white)  // to keep label color as white even in light mode
          
            } //: VSTACK
        }  //: ZSTACK
        .onAppear {
            isAnimating = true
        }
    }
}

//MARK: - PREVIEW
struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
