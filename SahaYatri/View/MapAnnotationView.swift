//
//  MapAnnotationView.swift
//  SahaYatri
//
//  Created by Aayam Adhikari on 30/09/2023.
//

import SwiftUI

// CUSTOM ANNOTATION VIEW TO PUT IN THE MAP

struct MapAnnotationView: View {
    //MARK: - PROPERTIES
    var location: BusLocation  // to use location's image
//    var location: ChangingBusLocation
    
    // to provide animation to the circular shape
    @State private var animation: Double = 0.0
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            
            // Shape (View) to scale up with Animation
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))  // doubles the size of shape
                .opacity(1 - animation)
            
            Image(systemName: "bus.doubledecker.fill")
                .resizable()
                .scaledToFit()
                .font(.footnote)
                .frame(width: 43, height: 43)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.accentColor, lineWidth: 2)
                )
//                .onTapGesture {
//                    // BUS INFO PANNEL
////                    BusDetailView(location: self.location)
//                }
                
        }  //: ZSTACK
        .onAppear {
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                
                // every time the view appears on the screen the value of animation property changes from 0 to 1 and repeats forever in the view where this property is used
                animation = 1
            }
        }
    }
}

//MARK: - PREVIEW
struct MapAnnotationView_Previews: PreviewProvider {
    
    static let locations: [BusLocation] = Bundle.main.decode("buseslocation.json")
    
    static var previews: some View {
        MapAnnotationView(location: locations[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
