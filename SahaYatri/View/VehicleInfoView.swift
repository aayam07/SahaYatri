//
//  VehicleInfoView.swift
//  SahaYatri
//
//  Created by Aayam Adhikari on 01/10/2023.
//

import SwiftUI

struct VehicleInfoView: View {
    //MARK: - PROPERTY
    
    var headerText: String
    
    var vehicle: [String]
    
    //MARK: - BODY
        
        //MARK: - BODY
        var body: some View {
            GroupBox() {
                DisclosureGroup(headerText) {
                    ForEach(0..<vehicle.count, id: \.self) { item in
                        
                        // to provide horizontal line between each row
                        Divider().padding(.vertical, 2)
                        
                        HStack {
                            Group {
                                Text(vehicle[item])
                            }
//                            .foregroundColor(fruit.gradientColors[1])
                            .font(Font.system(.body).bold())
                            
                            Spacer(minLength: 35)  // to ensure that the lable and content is not so close to eachother
                            
//                            Text(fruit.nutrition[item])
    //                            .multilineTextAlignment(.center)
                        }
    //                    .padding(.top, 10)
                    }
                    
                }
//                .foregroundColor(Color("InfoTextColor"))
                
                
            }  //: GROUP BOX
            
        }
}

//MARK: - PREVIEW
struct VehicleInfoView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleInfoView(headerText: "Local Vehicles", vehicle: [
            "Mayur","Sajha", "Ghumgham", "KUBus", "IOE", "Minerals"
           ])
    }
}
