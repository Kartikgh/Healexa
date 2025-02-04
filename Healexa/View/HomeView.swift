//
//  HomeView.swift
//  Healexa
//
//  Created by Karthik.Kurdekar on 03/02/25.
//

import SwiftUI

struct HomeView: View {
    @State private var searchQuery = ""
    @EnvironmentObject var router: NavigationRouter
    @StateObject private var viewModel = CategoryAndDoctorListViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                //Profile view
                profileView()
                
                // Search view
                searchView()
                
                FixedSpacer(height: 20)
                
                // Category and Doctor section view
                categoryandDoctorSectionView()
                
            }
            .onAppear {
                Logger.debug("This is a debug message")
                Logger.info("This is an info message")
                Logger.warning("This is a warning message")
                Logger.error("This is an error message")

            }
        }
        .padding(.top, 1)
        .scrollIndicators(.hidden)
    }
    
    @ViewBuilder
    private func profileView() -> some View {
        HStack {
            ProfileHeaderView(userName: Constants.userName)
            Spacer()
            
            Button(action: {
                //
            }) {
                Image(systemName: ImageAssetName.notificatioIcon)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.black)
            }
            .padding()
            .background(Color.appColorCardBg)
            .clipShape(Circle())
            
        }
        .padding()
    }
    
    @ViewBuilder
    private func searchView() -> some View {
        HStack {
            SearchBarView(searchText: $searchQuery)
            Button(action: {
                //
            }) {
                Image(systemName: ImageAssetName.filterIcon)
                    .resizable()
                    .frame(width: 20, height: 18)
                    .foregroundColor(Color.white)
                    .padding()
            }
            .background(Color.appColor6C4BA4)
            .cornerRadius(8)
            
            FixedSpacer(width: 20)
        }
        .padding([.top], 10)
    }
    
    @ViewBuilder
    private func categoryandDoctorSectionView() -> some View {
        SectionWithScrollableCardsView(title: Constants.categoryTitle, viewAllAction: {
            router.push(.allCategoryListView)
        }) {
            ForEach(viewModel.simpleCards, id: \.title) { data in
                SimpleCardView(samplecard: data)
            }
        }
        
        FixedSpacer(height: 25)
        
        SectionWithScrollableCardsView(title: Constants.bestDoctorTitle, viewAllAction: {
            router.push(.doctorListView)
        }) {
            ForEach(viewModel.multiCards, id: \.title) { data in
                MultiCardView(multicard: data)
            }
        }
        
        FixedSpacer()
    }
}
