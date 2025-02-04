//
//  HomeView.swift
//  Healexa
//
//  Created by Karthik.Kurdekar on 03/02/25.
//

import SwiftUI

struct HomeView: View {
    @State private var searchQuery = ""
    
    let simpleCards: [SimpleCard] = [
        SimpleCard(imageName: "heart.fill", title: "Cardiologist"),
        SimpleCard(imageName: "thermometer.medium", title: "Dentist"),
        SimpleCard(imageName: "brain.head.profile", title: "Neurologist"),
        SimpleCard(imageName: "lungs", title: "Pulmonologist"),
        SimpleCard(imageName: "eye", title: "Ophthalmologist"),
        SimpleCard(imageName: "ear", title: "Otolaryngologist")
    ]
    
    let multiCards: [MultiCard] = [
        MultiCard(imageName: "doctor1", title: "Dr.Vargo G", specialist: "Cardiologist", rating: "4.8"),
        MultiCard(imageName: "doctor2", title: "Dr.Sneha Nu", specialist: "Dentist", rating: "4.9"),
        MultiCard(imageName: "doctor3", title: "Dr.Perry K", specialist: "Neaurologist", rating: "4.6"),
        MultiCard(imageName: "doctor1", title: "Dr.Vargo G", specialist: "Cardiologist", rating: "4.8"),
        MultiCard(imageName: "doctor2", title: "Dr.Sneha Nu", specialist: "Dentist", rating: "4.9"),
        MultiCard(imageName: "doctor3", title: "Dr.Perry K", specialist: "Neaurologist", rating: "4.6")
        
    ]
    @EnvironmentObject var router: NavigationRouter
    
    var body: some View {
        
        ScrollView {
            VStack {
                HStack {
                    ProfileHeaderView(userName: "Alice Johnson")
                    Spacer()
                    
                    Button(action: {
                        //
                    }) {
                        Image(systemName: "bell")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background(Color.appColorCardBg)
                    .clipShape(Circle())
                    
                }
                .padding()
                
                HStack {
                    SearchBarView(searchText: $searchQuery)
                    Button(action: {
                        //
                    }) {
                        Image(systemName: "line.3.horizontal.decrease.circle")
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
                
                FixedSpacer(height: 20)
                
                SectionWithScrollableCardsView(title: "Categories", viewAllAction: {
                    print("View All Tapped")
                }) {
                    ForEach(simpleCards, id: \.title) { data in
                        SimpleCardView(samplecard: data)
                    }
                }
                
                FixedSpacer(height: 25)
                
                SectionWithScrollableCardsView(title: "Best Doctors", viewAllAction: {
                    print("View All Tapped")
                    router.push(.doctorListView)
                }) {
                    ForEach(multiCards, id: \.title) { data in
                        MultiCardView(multicard: data)
                    }
                }
                
                FixedSpacer()
                
            }
        }
        .padding(.top, 1)
        .scrollIndicators(.hidden)
        
    }
}

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
                    }
                    .padding(10)
                    , alignment: .center
                )
        }
        .frame(width: 120)
    }
}



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
                                
                            Image(systemName: "star.fill")
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


struct SimpleCard {
    var imageName: String
    var title: String
}

struct MultiCard {
    var id = UUID()
    var imageName: String
    var title: String
    var specialist: String
    var rating: String
}
