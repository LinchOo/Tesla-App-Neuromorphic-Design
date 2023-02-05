//
//  ContentView.swift
//  21_Neumorphism Design Tesla App
//
//  Created by Олег Коваленко on 04.02.2023.
//

import SwiftUI


struct ContentView: View {
    
    @State var isCarOpen = false
    @State var tagSelected = -1
    @State var controllsArray = ["lock","airOff","charging","trunkClouse"]
    @Environment(\.colorScheme) var colorScheme
    
    var gradient: LinearGradient {
        LinearGradient(colors: [Color("GradientTop"), Color("GradientBottom")], startPoint: .bottom, endPoint: .top)
    }
    
    
    var body: some View {
        backgroundStackView {
            VStack{
                HeaderView()
                CarView(isCarOpen: $isCarOpen)
                controllPanelView
                Spacer()
                CarControllsView(isCarOpen: $isCarOpen, tagSelected: $tagSelected)
                Spacer()
                    .frame(height: 25)
            }
            .background(
                Image("logo")
                    .resizable()
                    .frame()
                    .aspectRatio(contentMode: .fill)
                    .opacity(0.06)
                    .offset(y:11)
            )
        }
        
        
    }
    
    var controllPanelView: some View {
        HStack(spacing: 30) {
            ForEach(0..<controllsArray.count) { index in
                Button {
                    withAnimation(.spring(), {
                            tagSelected = index
                    })
                } label: {
                    Image("\(controllsArray[index])")
                        .resizable()
                        .frame(width: 40,height: 40)
                        .foregroundColor(.white)
                        .aspectRatio(contentMode: .fill)
                        .neumorphismSelectedCircleStyle()
                        .overlay {
                            Circle()
                                .stroke(gradient, lineWidth: 2)
                                .opacity(tagSelected == index ? 1 : 0)
                        }
                }
            }
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width - 25)
        .background(RoundedRectangle(cornerRadius: 50).fill(Color("Background")))
        .neumorphismUnSelectedStyle()
        
    }

    func backgroundStackView<Content: View>(content: () -> Content) -> some View {
        ZStack {
            Rectangle()
                .fill(Color("Background"))
                .frame(maxWidth: .infinity,maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            content()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
