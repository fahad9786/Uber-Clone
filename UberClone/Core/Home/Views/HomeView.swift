//
//  HomeVIew.swift
//  UberClone
//
//  Created by Fahad Sheikh on 2024-01-20.
//

import SwiftUI

struct HomeView: View {
    @State private var showLocationSearchView = false
    var body: some View {
        // ztack allows things to come upfront
        ZStack(alignment: .top) {
            UberMapViewRepresentable()
                // makes stretch to fit screen
                .ignoresSafeArea()
            
            // if not showing locaion view
            if showLocationSearchView{
                LocationSearchView(showLocationSearchView: $showLocationSearchView)
            }else{
                LocationSearchActivationView()
                    .padding(.top, 72)
                    .onTapGesture{
                        // make it cleaner animation
                        withAnimation(.spring()){
                            showLocationSearchView.toggle()
                        }
                    }
            }
            
            MapViewActionButton(showLocationSearchView:
                $showLocationSearchView)
                .padding(.leading)
                .padding(.top, 4)
            
            
        }
    }
}



struct HomeView_Previews: PreviewProvider{
    static var previews: some View {
        HomeView()
    }
}
