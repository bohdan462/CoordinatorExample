//
//  ScaledImageView.swift
//  CooordinatorProject
//
//  Created by Bohdan Tkachenko on 4/26/22.
//

import SwiftUI

struct ScaledImageView: View {
    let name: String
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
            .tag(0)
    }
}

//struct ScaledImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScaledImageView()
//    }
//}
