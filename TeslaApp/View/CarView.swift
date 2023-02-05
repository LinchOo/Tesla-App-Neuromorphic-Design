//
//  CarView.swift
//  TeslaApp
//
//  Created by Олег Коваленко on 05.02.2023.
//

import SwiftUI

struct CarView: View {
    @Binding var isCarOpen: Bool
    
    init(isCarOpen: Binding<Bool>){
        _isCarOpen = isCarOpen
    }
    
    var body: some View {
        Image(isCarOpen ? "tesla_doors" : "tesla_idle")
            .resizable()
            .frame(height: 220)
            .padding(.horizontal)
            .aspectRatio(contentMode: .fit)
    }
}

//struct CarView_Previews: PreviewProvider {
//    static var previews: some View {
//        CarView(isCarOpen: isCarOpen)
//    }
//}
