//
//  SettingsView.swift
//  Healexa
//
//  Created by Karthik.Kurdekar on 03/02/25.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var logger = Logger.shared
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(logger.logs, id: \..self) { log in
                    Text(log)
                        .font(.caption)
                        .padding()
                }
            }
            .frame(height: 300)
            Button("Clear Logs") {
                logger.logs.removeAll()
            }
        }
    }
}


