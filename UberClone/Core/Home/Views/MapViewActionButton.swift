//
//  MapViewActionButton.swift
//  UberClone
//
//  Created by Fahad Sheikh on 2024-01-23.
//

import SwiftUI

struct MapViewActionButton: View {
    @Binding var showLocationSearchView: Bool
    var body: some View {
        
        Button{
            withAnimation(.spring()){
                showLocationSearchView.toggle()
            }
        } label: {
            // when showing location itll be left arrow otherwise hamburger icon
            Image(systemName: showLocationSearchView ?
                  "arrow.left": "line.3.horizontal")
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .shadow(color: .black, radius: 6)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct MapViewActionButton_Previews: PreviewProvider{
    static var previews: some View {
        // pass binding whether not we showing
        (MapViewActionButton(showLocationSearchView: . constant(true)))
    }
}
