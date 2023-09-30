//
//  StartButtonView.swift
//  SahaYatri
//
//  Created by Aayam Adhikari on 29/09/2023.
//

import SwiftUI

struct StartButtonView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Image(systemName: "bus.fill")
                .font(.title)
                .foregroundColor(.white)
        }
    }
}

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
