//
//  ScaledImageView.swift
//  CoodinatorPattern
//
//  Created by 최승원 on 2022/08/15.
//

import SwiftUI

struct ScaledImageView: View {
    let name: String
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
    }
}

//struct ScaledImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScaledImageView()
//    }
//}
