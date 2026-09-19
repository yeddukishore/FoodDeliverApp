//
//  HomeView.swift
//  FoodDeliverApp
//
//  Created by Olive Mac4 on 08/09/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        HStack {
            Text("Hello Kishore")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "dummyUser")
            
        }
    }
}

#Preview {
    HomeView()
}
