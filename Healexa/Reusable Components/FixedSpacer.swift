//
//  FixedSpacer.swift
//  Healexa
//
//  Created by Karthik.Kurdekar on 03/02/25.
//

import SwiftUI

struct FixedSpacer: View {
    var width: CGFloat?
    var height: CGFloat?
    var body: some View {
        if width != nil, height != nil {
            Spacer().frame(width: width, height: height)
        } else if height != nil, width == nil {
            Spacer().frame(height: height)
        } else if width != nil, height == nil {
            Spacer().frame(width: width)
        } else {
            Spacer()
        }
    }
}

struct FixedSpacer_Previews: PreviewProvider {
    static var previews: some View {
        FixedSpacer()
    }
}
