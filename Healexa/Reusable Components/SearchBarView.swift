//
//  SearchBarView.swift
//  Healexa
//
//  Created by Karthik.Kurdekar on 03/02/25.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    var placeholder: String = Constants.searchPlaceholderTitle
    
    var body: some View {
        HStack {
            // Search Icon
            Image(systemName: ImageAssetName.searchIcon)
                .foregroundColor(.gray)
            
            // Search TextField
            TextField(placeholder, text: $searchText)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
            
            // Clear Button (Shows only when text is not empty)
            if !searchText.isEmpty {
                Button(action: {
                    searchText = ""
                }) {
                    Image(systemName: ImageAssetName.clearButtonIcon)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(10)
        .frame(height: 50)
        .background(Color.appColorCardBg)
        .cornerRadius(8)
        .padding(.horizontal)
    }
}

