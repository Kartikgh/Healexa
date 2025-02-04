//
//  DoctorListView.swift
//  Healexa
//
//  Created by Karthik.Kurdekar on 03/02/25.
//

import SwiftUI

struct DoctorListView: View {
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
        VStack {
            CustomNavBarView {
                Button(action: {
                    router.pop()
                }) {
                    Image(systemName: "chevron.backward")
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
                Text("All Doctors")
                    .fontAndColor(name: AppFont.bold.name, size: AppFontSize.size20.value, color: Color.appColorHeaderTitle)
            }
            FixedSpacer(height: 20)
            ScrollView {
                SectionWithScrollableCardsView(
                    title: "",
                    isVertical: true,
                    showViewAll: false,
                    viewAllAction: { print("View All Tapped!") }
                ){
                    LazyVGrid(columns: gridItems, spacing: 15) {
                        ForEach(multiCards, id: \.id) { data in
                            MultiCardView(multicard: data)
                                
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
        }
        .navigationBarHidden(true)
        
    }
    
    private var gridItems: [GridItem] {
        [
            GridItem(.flexible(), spacing: 10),
            GridItem(.flexible(), spacing: 10)
        ]
    }
}
