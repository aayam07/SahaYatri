//
//  MapView.swift
//  SahaYatri
//
//  Created by Aayam Adhikari on 29/09/2023.
//

import SwiftUI
import MapKit
import CoreLocation
import Firebase

struct MapView: View {
    //MARK: - PROPERTIES
    
    @AppStorage("onBoarding") var isOnboardingViewActive: Bool = false
    
    // Location Manager Object
    @StateObject var locationManager = LocationManager()
    
    @State private var busSearchText: String = ""
    
    @State private var searchFieldIsAnimating: Bool = false
    
    @State private var isInfoPannelVisible: Bool = false
    
    // to create heptic feedback when the user taps on a vehicle icon
    let hepticFeedback = UIImpactFeedbackGenerator(style: .medium)
    
    // USING SWIFT CLOSURE TO PREPARE MAP REGION TO DISPLAY
    @State private var region: MKCoordinateRegion = {
        
        var mapCoordinates = CLLocationCoordinate2D(latitude: 27.7172, longitude: 85.3240)
        
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
        
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()  // CLOSURE
    
    let locations: [BusLocation] = Bundle.main.decode("buseslocation.json")
    
    
    //MARK: - BODY
    var body: some View {
        
        Group {
            
            VStack {
                //MARK: - HEADER
                
                HStack(spacing: 10) {
                    // TITLE
                    Text("Saha Yatri.")
                        .padding(.top, 2)
                        .font(.system(.title, design: .rounded, weight: .heavy))
                        .foregroundColor(.accentColor)
                        .padding(.leading, 4)
                    
                } //: HSTACK
                
//                Spacer(minLength: 80)
                
                Group {
                    //        //MARK: - MAP WITH ANNOTATIONS (ADVANCED MAP)
                    Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
                        
                        MapAnnotation(coordinate: item.locationCoordinates, content: {
                            MapAnnotationView(location: item)
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        hepticFeedback.impactOccurred()
                                        isInfoPannelVisible = true
                                    }
                                    
                                }
                            
                        })
                        
                    })  //: MAP
//                    .edgesIgnoringSafeArea(.all)
                    .overlay (
                        
                        GroupBox {
                            HStack {
                                    TextField("Search Bus Name", text: $busSearchText)
                                        .foregroundColor(.accentColor)
                                        .font(.system(size: 24, weight: .bold, design: .rounded))
                                        .padding()
                                        .background(
                                            Color(UIColor.tertiarySystemBackground)
                                        )
                                        .cornerRadius(10)
//                                        .padding()
                                    
                                    
                                    Button {
                                        // Some Action to search
                                        
                                    } label: {
                                        Image(systemName: "magnifyingglass.circle.fill")
                                            .foregroundColor(Color("InfoTextColor"))
                                            .font(.largeTitle)
                                    }
//                                    .padding(.trailing, 20)
                                    
                            }  //: HSTACK
                            .opacity(1)
                        } //: GROUP BOX
                            .groupBoxStyle(AccentColorGroupBoxStyle())
            //                    .offset(y: searchFieldIsAnimating ? -300 : 0)
                            , alignment: .top
                    )
                    .overlay (
                        BusDetailView()
                            .padding(.vertical, 12) // provides padding to the content i.e background
                            .padding(.horizontal, 16) // provides padding to the content i.e background
                            .background(
                                Color.white
                                    .cornerRadius(8)
                                    .opacity(1)
                            )
                            .padding()  // provides padding to the outside the whole HStack
                            .opacity(isInfoPannelVisible ? 1 : 0)
                        , alignment: .bottom
                            
                    )
                }  //: GROUP
                
            }
            
        }
    }
}


//MARK: - PREVIEW
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
