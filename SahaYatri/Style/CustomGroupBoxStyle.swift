//
//  CustomGroupBoxStyle.swift
//  SahaYatri
//
//  Created by Aayam Adhikari on 30/09/2023.
//

import Foundation
import SwiftUI

struct AccentColorGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.label
            configuration.content
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 8, style: .continuous)
            .fill(Color.accentColor.opacity(0.25)))
    }
}
