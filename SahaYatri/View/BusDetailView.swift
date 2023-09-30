//
//  BusDetailView.swift
//  SahaYatri
//
//  Created by Aayam Adhikari on 30/09/2023.
//

import SwiftUI

struct BusDetailView: View {
    //MARK: - PROPERTY
    
//    var location: BusLocation
    
    //MARK: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 12, content: {
            Image(systemName: "bus")
                .resizable()
                .scaledToFit()
                .foregroundColor(.accentColor)
                .frame(width: 48, height: 48, alignment: .center)
            
            VStack(alignment: .leading, spacing: 3) {
                HStack {
                    Text("Name:")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                    
                    Spacer()
                    
                    Text("Mayur")
                        .font(.footnote)
                        .foregroundColor(Color("InfoTextColor"))
                }
                
                Divider()
                
                HStack {
                    Text("Time Until Arrival:")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                    
                    Spacer()
                    
                    Text("7 minutes")
                        .font(.footnote)
                        .foregroundColor(Color("InfoTextColor"))
                }
                
                Divider()
                
                HStack {
                    Text("Traffic:")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                    
                    Spacer()
                    
                    Text("High")
                        .font(.footnote)
                        .foregroundColor(Color("InfoTextColor"))
                }
            }
        })  //: HSTACK
    }
}

//MARK: - PREVIEW
struct BusDetailView_Previews: PreviewProvider {
//    static let locations: [BusLocation] = Bundle.main.decode("buseslocation.json")
    
    static var previews: some View {
        BusDetailView()
//            .previewLayout(.sizeThatFits)
            .padding()
    }
}
