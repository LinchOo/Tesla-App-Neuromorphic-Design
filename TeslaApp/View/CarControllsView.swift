//
//  CarControllsView.swift
//  TeslaApp
//
//  Created by Олег Коваленко on 05.02.2023.
//

import SwiftUI

struct CarControllsView: View {
    @Environment(\.colorScheme) var colorScheme
        @Binding var isCarOpen: Bool
        @Binding var tagSelected: Int
        init(isCarOpen: Binding<Bool>, tagSelected: Binding<Int>){
            _isCarOpen = isCarOpen
            _tagSelected = tagSelected
        }
//    @State var isCarOpen = false
//    @State var tagSelected = 1
        
//    //MARK: Body
    var body: some View {
        Spacer()
        switch tagSelected {
        case 0:
            closeCarControllView
        case 1:
            AirControllView()
        case 2:
            chargeModeView
        case 3:
            carTrunkControllView
        default:
            EmptyView()
        }
        
    }

    var chargeModeView: some View {
        Text("chargeMode")
    }
    var carTrunkControllView: some View{
        Text("carTrunkControll")
    }
    
    var closeCarControllView: some View {
        Button {
            withAnimation {
                isCarOpen.toggle()
            }
        } label: {
            HStack {
                Label {
                    Text(isCarOpen ? "Car Open" : "Car Clouse")
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .font(.system(size: 25))
                        .frame(width: 120)
                } icon: {
                    Image(systemName: isCarOpen ? "lock.open.fill" : "lock.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .neumorphismSelectedCircleStyle()
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width - 100, height: UIScreen.main.bounds.height / 8 )
                
                .background(RoundedRectangle(cornerRadius:50).fill(Color("Background")))
                .neumorphismSelectedStyle()
            }
            
            
        }
    }
}

//struct CarControllsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CarControllsView()
//    }
//}
//
