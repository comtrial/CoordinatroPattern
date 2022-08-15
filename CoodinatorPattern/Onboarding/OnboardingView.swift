//
//  OnboardingView.swift
//  CoodinatorPattern
//
//  Created by 최승원 on 2022/08/15.
//

import SwiftUI

struct OnboardingView: View {
    //MARK: doneRequested 
    var doneRequested: () -> ()
    var body: some View {
        
        TabView {
            ScaledImageView(name: "onboarding1")
                .tag(0)
            ScaledImageView(name: "onboarding2")
                .tag(1)
            ScaledImageView(name: "onboarding3")
                .tag(2)
            Button("Done") {
                doneRequested()
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .background(Color.white)
        

    }
}

//struct OnboardingView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingView()
//    }
//}
