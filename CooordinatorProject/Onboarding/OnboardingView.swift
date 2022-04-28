//
//  OnbordingView.swift
//  CooordinatorProject
//
//  Created by Bohdan Tkachenko on 4/26/22.
//

import SwiftUI

struct OnboardingView: View {
    
    var doneRequested: () -> ()
    
    var body: some View {
        TabView {
            ScaledImageView(name: "1.jpg")
                .tag(0)
            ScaledImageView(name: "2.jpg")
                .tag(1)
            ScaledImageView(name: "3.jpg")
                .tag(2)
            Button("Done") {
                doneRequested()
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .background(Color.black
                        .ignoresSafeArea(.all))
    }
}

struct OnboardingView_Preview: PreviewProvider {
    static var previews: some View {
        OnboardingView(doneRequested: { } )
    }
}
