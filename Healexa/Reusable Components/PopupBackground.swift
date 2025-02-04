//
//  PopupBackground.swift
//  Healexa
//
//  Created by Karthik.Kurdekar on 04/02/25.
//

import SwiftUI

struct PopupBackground: View {
    var dismiss: () -> Void
    
    var body: some View {
        Color.black.opacity(0.4)
            .edgesIgnoringSafeArea(.all)
            .onTapGesture {
                dismiss()
            }
    }
}
