//
//  MessageView.swift
//  SahaYatri
//
//  Created by Aayam Adhikari on 30/09/2023.
//

import SwiftUI

struct MessageView: View {
//    @Environment(\.dismiss) private var dismiss
//
//    var message: String
//
//    var body: some View {
//        VStack {
//            Text(message)
//                .padding(.bottom, 20)
//
//            Button("OK") {
//                dismiss()
//            }
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.white)
//    }
    
    @Binding var show: Bool
    
//    var message: String
    
    var body: some View {
        if show {
            VStack {
                Text("Success!")
                    .font(.title)
                    .padding()
                Button(action: {
                    show = false
                }) {
                    Text("OK")
                        .padding()
//                        .background(Color.accentColor)
                        .foregroundColor(.accentColor)
                        .cornerRadius(10)
                }
            }
            .frame(width: 300, height: 200)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 20)
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(show: .constant(true))
    }
}
