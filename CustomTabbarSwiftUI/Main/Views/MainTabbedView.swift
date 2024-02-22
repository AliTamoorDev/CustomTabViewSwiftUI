//
//  ContentView.swift
//  CustomTabbarSwiftUI
//
//  Created by Ali Tamoor on 14/02/2024.
//

import SwiftUI



struct MainTabbedView: View {
    
    @State var selectedTab = 0
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            TabView(selection: $selectedTab) {
                HomeView()
                    .tag(0)
                
                FavoriteView()
                    .tag(1)
                
                ChatView()
                    .tag(2)
                
                ProfileView()
                    .tag(3)
            }
            
            ZStack{
                HStack{
                    ForEach((TabbedItems.allCases), id: \.self){ item in
                        Button{
                            selectedTab = item.rawValue
                        } label: {
                            CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                        }
                    }
                }
                .padding(6)
            }
            .background(.black.opacity(0.8))
            .cornerRadius(35)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.white, lineWidth: 1) // Adjust the color and width as needed
            )
            .padding(.horizontal, 26)
        }
        .padding(.horizontal, 50)
    }
}

#Preview {
    MainTabbedView(selectedTab: 0)
}


// MARK: - Custom Items
extension MainTabbedView {
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View{
        HStack(spacing: 10){
            Spacer()
            Text(title)
                .font(.system(size: 16))
                .bold()
                .foregroundColor(.white)
            Spacer()
        }
        .padding()
        .background(isActive ? .red.opacity(0.8) : .clear)
        .cornerRadius(30)
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.white, lineWidth: isActive ? 1 : 0)
        )
        .fixedSize(horizontal: true, vertical: false)
    }
}
