//
//  TabBarView.swift
//  BookReading
//
//  Created by Bahareh Ahmadi on 2023-01-22.
//

import SwiftUI

struct TabItemData {
    let image: String
    let selectedImage: String
    let title : String
}

struct TabItemView: View {
    let info: TabItemData
    let isSelected: Bool
    var body : some View {
        VStack {
            Image(systemName: isSelected ? info.selectedImage : info.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
            Spacer().frame(height: 4)
            Text(info.title)
                .foregroundColor(isSelected ? .black : .gray)
                
                .font(.system(size:14))
        }
        .padding()
    }
}

struct TabBottomView: View {
    let tabbarItems: [TabItemData]
    var height: CGFloat = 70
    var width: CGFloat = UIScreen.main.bounds.width - 32
    @Binding var selectedIndex: Int
    
    var body : some View {
        HStack {
            Spacer()
            
            ForEach(tabbarItems.indices) { i in
                let item = tabbarItems[i]
                Button {
                    self.selectedIndex = i
                } label: {
                    let isSelected = selectedIndex == i
                    TabItemView(info: item, isSelected: isSelected)
                }
                
                Spacer()
            }
        }
        .frame(width: width, height: height)
        .background(Color.white)
        .cornerRadius(13)
        .shadow(radius: 5,x: 0, y: 4)
    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBottomView(tabbarItems: [], selectedIndex: .constant(0))
    }
}
