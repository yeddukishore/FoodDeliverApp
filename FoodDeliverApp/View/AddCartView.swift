//
//  AddCartView.swift
//  FoodDeliverApp
//
//  Created by Olive Mac4 on 25/09/26.
//

import SwiftUI
//
//  AddCartView.swift
//  FoodDeliverApp
//
//  Created by Olive Mac4 on 25/09/26.
//

import SwiftUI

struct AddCartView: View {
    // MARK: - State Properties
    @State private var selectedSize: String = "Regular"
    @State private var quantity: Int = 1
    @State private var isFavorite: Bool = false
    
    let sizes = ["Regular", "Medium", "Large"]
    let basePrice: Int = 249
    
    // Total price calculated based on quantity
    var totalPrice: Int {
        basePrice * quantity
    }

    var body: some View {
        VStack(spacing: 0) {
            
            // MARK: - 1. Top Navigation Bar
            HStack {
                Button(action: {
                    // Dismiss view / Go back
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title3.bold())
                        .foregroundColor(.primary)
                        .padding(10)
                        .background(Color(.systemGray6))
                        .clipShape(Circle())
                }
                
                Spacer()
                
                Button(action: {
                    isFavorite.toggle()
                }) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .font(.title3)
                        .foregroundColor(isFavorite ? .red : .secondary)
                        .padding(10)
                        .background(Color(.systemGray6))
                        .clipShape(Circle())
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            
            // MARK: - Scrollable Content
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    
                    // MARK: - 2. Hero Image
                    Image("cheese-burger") // Replace with your asset name
                        .resizable()
                        .scaledToFit()
                        .frame(width: 260, height: 260)
                        .shadow(color: .black.opacity(0.12), radius: 15, y: 8)
                        .padding(.top, 10)
                    
                    // MARK: - 3. Title, Description & Price
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Burger")
                            .font(.title2.bold())
                        
                        Text("Classic delight with 100% real mozzarella cheese.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineSpacing(4)
                        
                        Text("₹\(basePrice)")
                            .font(.title3.bold())
                            .foregroundColor(.primary)
                            .padding(.top, 4)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // MARK: - 4. Size Selection
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Size")
                            .font(.headline)
                        
                        HStack(spacing: 12) {
                            ForEach(sizes, id: \.self) { size in
                                Button(action: {
                                    withAnimation(.spring(response: 0.3)) {
                                        selectedSize = size
                                    }
                                }) {
                                    Text(size)
                                        .font(.subheadline.bold())
                                        .foregroundColor(selectedSize == size ? .white : .primary)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 20)
                                        .background(selectedSize == size ? Color.red : Color(.systemGray6))
                                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // MARK: - 5. Quantity Stepper
                    HStack(spacing: 24) {
                        Button(action: {
                            if quantity > 1 { quantity -= 1 }
                        }) {
                            Image(systemName: "minus")
                                .font(.headline.bold())
                                .foregroundColor(.primary)
                                .frame(width: 36, height: 36)
                        }
                        
                        Text("\(quantity)")
                            .font(.title3.bold())
                        
                        Button(action: {
                            quantity += 1
                        }) {
                            Image(systemName: "plus")
                                .font(.headline.bold())
                                .foregroundColor(.primary)
                                .frame(width: 36, height: 36)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 6)
                    .background(Color(.systemGray6))
                    .clipShape(Capsule())
                    .padding(.top, 10)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            }
            
            // MARK: - 6. Bottom "Add to Cart" Button (Sticky)
            Button(action: {
                // Add item to cart action
                print("Added \(quantity) \(selectedSize) Burger(s) for ₹\(totalPrice)")
            }) {
                Text("Add to Cart")
                    .font(.headline.bold())
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(Color.red)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .shadow(color: Color.red.opacity(0.35), radius: 10, y: 5)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 12)
        }
        .background(Color(.systemBackground))
    }
}

#Preview {
    AddCartView()
}

//struct AddCartView: View {
//    var body: some View {
//        VStack {
//            Image("cheese-burger")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 300,height: 300)
//               // .padding(20)
//           
//            VStack(alignment: .leading){
//                Text("Burger")
//                .fontWeight(.bold)
//                .padding(.top,10)
//                Text("Classic Details with 100% real mozzella cheese")
//                    .font(.headline)
//                    Text("249")
//                    .fontWeight(.bold)
//                    .padding(20)
//                Text("Size")
//                .fontWeight(.bold)
//                .padding(20)
//            }
//            
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .padding(.horizontal, 20)
//           
//            
//            Spacer()
//        }
//    }
//}

#Preview {
    AddCartView()
}
