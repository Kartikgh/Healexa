//
//  CustomNavBarView.swift
//  Healexa
//
//  Created by Karthik.Kurdekar on 03/02/25.
//

import Foundation
import SwiftUI

struct CustomNavBarView<LeftView, CenterView, RightView>: View where LeftView: View, CenterView: View, RightView: View {
    let leftView: () -> LeftView?
    let centerView: () -> CenterView?
    let rightView: () -> RightView?

    init(@ViewBuilder leftView: @escaping () -> LeftView? = { FixedSpacer() }, @ViewBuilder centerView: @escaping () -> CenterView = { FixedSpacer() }, @ViewBuilder rightView: @escaping () -> RightView = { FixedSpacer() }) {
        self.leftView = leftView
        self.rightView = rightView
        self.centerView = centerView
    }
    
    var body: some View {
        HStack(alignment: .center) {
            FixedSpacer(width: 5)
            if leftView() is FixedSpacer {
                leftView()
                    .frame(width: 44, alignment: .leading)
            } else {
                leftView()
                    .frame(alignment: .leading)
            }
            FixedSpacer(width: 5)
            centerView()
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
            FixedSpacer(width: 5)
            if rightView() is FixedSpacer {
                rightView()
                    .frame(width: 44, alignment: .trailing)
            } else {
                rightView()
                    .frame(alignment: .trailing)
            }
            FixedSpacer(width: 5)
        }
        .frame(height: 44)
    }
}
