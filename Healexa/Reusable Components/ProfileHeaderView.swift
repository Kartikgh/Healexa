//
//  ProfileHeaderView.swift
//  Healexa
//
//  Created by Karthik.Kurdekar on 03/02/25.
//

import SwiftUI

struct ProfileHeaderView: View {
    var profileImage: String
    var userName: String
    
    init(profileImage: String = "avatar", userName: String = "John Doe") {
        self.profileImage = profileImage
        self.userName = userName
    }

    var body: some View {
        HStack {
            // Profile Image
            Image(profileImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 48, height: 48)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    )
            
            VStack(alignment: .leading, spacing: 5) {
                // Welcome Message
                Text("Hi,")
                    .fontAndColor(name: AppFont.regular.name, size: AppFontSize.size12.value, color: Color.appColorWelcomeTitle)
                
                // User Name
                Text(userName)
                    .fontAndColor(name: AppFont.bold.name, size: AppFontSize.size14.value, color: Color.appColorNameTitle)
            }
        }
    }
}
