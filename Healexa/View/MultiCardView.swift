//
//  MultiCardView.swift
//  Healexa
//
//  Created by Karthik.Kurdekar on 04/02/25.
//

import SwiftUI

struct MultiCardView: View {
    var multicard: MultiCard
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.appColorCardBg)
                .frame(width: 160, height: 230)
                .overlay(
                    VStack {
                        Button {
                            //
                        } label: {
                            Image(multicard.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 120)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        
                        FixedSpacer(height: 10)
                        Text(multicard.title)
                            .fontAndColor(name: AppFont.bold.name, size: AppFontSize.size16.value, color: Color(.black))
                        FixedSpacer(height: 5)
                        HStack {
                            Text(multicard.specialist)
                                .fontAndColor(name: AppFont.regular.name, size: AppFontSize.size12.value, color: Color(.gray))
                                
                            Image(systemName: ImageAssetName.ratingIcon)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 15, height: 15)
                                .foregroundColor(.yellow)
                            FixedSpacer(width: 2)
                            Text(multicard.rating)
                                .fontAndColor(name: AppFont.regular.name, size: AppFontSize.size10.value, color: Color(.black))
                        }
                    }
                    .padding(10)
                    , alignment: .center
                )
        }
        .frame(width: 160)
    }
}
