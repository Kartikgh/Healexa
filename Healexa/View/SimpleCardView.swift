//
//  SimpleCardView.swift
//  Healexa
//
//  Created by Karthik.Kurdekar on 04/02/25.
//

import SwiftUI

struct SimpleCardView: View {
    var samplecard: SimpleCard
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.appColorCardBg)
                .frame(width: 120, height: 150)
                .overlay(
                    VStack {
                        Button {
                            //
                        } label: {
                            Image(systemName: samplecard.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .foregroundColor(.black)
                        }
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                        .buttonStyle(PlainButtonStyle())
                        
                        Text(samplecard.title)
                            .fontAndColor(name: AppFont.regular.name, size: AppFontSize.size14.value, color: Color.black)
                            .padding(.top, 5)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                    }
                    .padding(10)
                    , alignment: .center
                )
        }
        .frame(width: 120)
    }
}
