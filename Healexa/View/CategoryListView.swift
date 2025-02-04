//
//  CategoryListView.swift
//  Healexa
//
//  Created by Karthik.Kurdekar on 04/02/25.
//

import Foundation
import SwiftUI

struct CategoryListView: View {
    
    @StateObject private var viewModel = CategoryAndDoctorListViewModel()
    @EnvironmentObject var router: NavigationRouter
    
    var body: some View {
        VStack {
            CustomNavBarView {
                Button(action: {
                    router.pop()
                }) {
                    Image(systemName: ImageAssetName.backIcon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                }
                .padding()
                .background(Color.appColorCardBg)
                .clipShape(Circle())
            } centerView: {
                Text(Constants.allCategoriesTitle)
                    .fontAndColor(name: AppFont.bold.name, size: AppFontSize.size20.value, color: Color.appColorHeaderTitle)
            }
            FixedSpacer(height: 20)
            ScrollView {
                SectionWithScrollableCardsView(
                    title: "",
                    isVertical: true,
                    showViewAll: false,
                    viewAllAction: {  }
                ){
                    LazyVGrid(columns: gridItems, spacing: 15) {
                        ForEach(viewModel.simpleCards, id: \.id) { data in
                            SimpleCardView(samplecard: data)
                        }
                    }
                }
            }
            
        }
        .navigationBarHidden(true)
        
    }
    
    private var gridItems: [GridItem] {
        [
            GridItem(.flexible(), spacing: 10),
            GridItem(.flexible(), spacing: 10),
            GridItem(.flexible(), spacing: 10)
            
        ]
    }
}
