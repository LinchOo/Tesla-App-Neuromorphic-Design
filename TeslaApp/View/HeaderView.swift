//
//  HeaderView.swift
//  TeslaApp
//
//  Created by Олег Коваленко on 05.02.2023.
//

import SwiftUI

struct HeaderView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
            VStack(alignment: .center) {
                Text("Tesla Model X")
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                Text("226 km")
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .opacity(0.4)
            }
            .padding(.all,25)
//            .background(
//                Image("logo")
//                    .resizable()
//                    .frame(width: 200, height: 200)
//                    .aspectRatio(contentMode: .fit)
//                    .opacity(0.06)
//                    .offset(y:100)
//            )
        
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
