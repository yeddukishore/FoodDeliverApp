//
//  FoodCategoryView.swift
//  FoodDeliverApp
//
//  Created by Olive Mac4 on 23/09/26.
//

import SwiftUI

struct FoodCategoryView: View {
    var body: some View {
        let items = [
            FoodCategory(name: "", imageName: "pizza"),
            FoodCategory(name: "", imageName: "pizza"),
       FoodCategory(name: "", imageName: "ice-cream")
        ]
       
    }
}

#Preview {
    FoodCategoryView()
}
