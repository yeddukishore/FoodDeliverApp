//
//  HomeView.swift
//  FoodDeliverApp
//
//  Created by Olive Mac4 on 08/09/26.
//

import SwiftUI

// MARK: - Models
struct FoodCategory: Identifiable {
    let id = UUID()
    let name: String
    let icon: String // SF Symbol or Asset Name
}

struct Restaurant: Identifiable {
    let id = UUID()
    let name: String
    let cuisine: String
    let rating: Double
    let deliveryTime: String
    let priceForTwo: String
    let imageName: String
}

// MARK: - Main HomeView
struct HomeView: View {
    @State private var searchText: String = ""
    @State private var selectedCategory: String = "All"
    @State private var selectedTab: Int = 0
    
    let categories: [FoodCategory] = [
        FoodCategory(name: "All", icon: "square.grid.2x2.fill"),
        FoodCategory(name: "Pizza", icon: "takeoutbag.and.cup.and.straw.fill"),
        FoodCategory(name: "Burger", icon: "fork.knife"),
        FoodCategory(name: "Biryani", icon: "flame.fill")
    ]
    
    // Sample Restaurants (matching diagram)
    let restaurants: [Restaurant] = [
        Restaurant(
            name: "Domino's Pizza",
            cuisine: "Italian, Pizza",
            rating: 4.3,
            deliveryTime: "30 min",
            priceForTwo: "₹200 for two",
            imageName: "pizza.fill" // Replace with your asset image
        ),
        Restaurant(
            name: "KFC",
            cuisine: "American, Fast Food",
            rating: 4.1,
            deliveryTime: "25 min",
            priceForTwo: "₹250 for two",
            imageName: "takeoutbag.and.cup.and.straw.fill"
        ),
        Restaurant(
            name: "Burger King",
            cuisine: "Burgers, Fast Food",
            rating: 4.4,
            deliveryTime: "20 min",
            priceForTwo: "₹220 for two",
            imageName: "fork.knife"
        )
    ]
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            // MARK: - Tab 1: Home Screen
            NavigationStack {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 20) {
                        headerSection
                        searchBarSection
                        categoriesSection
                        popularRestaurantsSection
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    .padding(.bottom, 24)
                }
                .background(Color(.systemBackground))
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            .tag(0)
            
            // MARK: - Tab 2: Orders Screen
            Text("Orders Screen")
                .tabItem {
                    Label("Orders", systemImage: "bag.fill")
                }
                .tag(1)
            
            // MARK: - Tab 3: Profile Screen
            Text("Profile Screen")
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
                .tag(2)
        }
        .tint(.red) // Sets active tab icon color to Red (matching design)
    }
}

// MARK: - Subviews / Sections
private extension HomeView {
    // MARK: - 1. Header View
    var headerSection: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Hello, Kishore 👋")
                    .font(.title2.bold())
                
                HStack(spacing: 4) {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(.red)
                        .font(.caption.bold())
                    
                    Text("Hyderabad, India")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Image(systemName: "chevron.down")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
            }
            
            Spacer()
            
            // Notification or Profile Avatar
            Button(action: {}) {
                ZStack(alignment: .topTrailing) {
                    Image(systemName: "bell.fill")
                        .font(.title3)
                        .foregroundColor(.primary)
                        .padding(10)
                        .background(Color(.systemGray6))
                        .clipShape(Circle())
                    
                    Circle()
                        .fill(Color.red)
                        .frame(width: 9, height: 9)
                        .offset(x: -2, y: 2)
                }
            }
        }
    }
    
    // MARK: - 2. Search Bar
    var searchBarSection: some View {
        HStack(spacing: 12) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            
            TextField("Search restaurants or food", text: $searchText)
                .font(.subheadline)
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
    // MARK: - 3. Horizontal Categories
    var categoriesSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(categories) { category in
                    Button(action: {
                        withAnimation(.spring(response: 0.3)) {
                            selectedCategory = category.name
                        }
                    }) {
                        VStack(spacing: 8) {
                            ZStack {
                                Circle()
                                    .fill(selectedCategory == category.name ? Color.red : Color(.systemGray6))
                                    .frame(width: 56, height: 56)
                                
                                Image(systemName: category.icon)
                                    .font(.title3)
                                    .foregroundColor(selectedCategory == category.name ? .white : .primary)
                            }
                            
                            Text(category.name)
                                .font(.caption.bold())
                                .foregroundColor(selectedCategory == category.name ? .red : .secondary)
                        }
                    }
                }
            }
            .padding(.vertical, 4)
        }
    }
    
    // MARK: - 4. Popular Restaurants Section
    var popularRestaurantsSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Popular Restaurants")
                .font(.title3.bold())
            
            LazyVStack(spacing: 14) {
                ForEach(restaurants) { restaurant in
                    restaurantCard(restaurant)
                }
            }
        }
    }
    
    // MARK: - Restaurant Card Component
    func restaurantCard(_ restaurant: Restaurant) -> some View {
        HStack(spacing: 14) {
            // Food Thumbnail
            ZStack {
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(Color.orange.opacity(0.15))
                    .frame(width: 80, height: 80)
                
                Image(systemName: restaurant.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.orange)
            }
            
            // Restaurant Info
            VStack(alignment: .leading, spacing: 4) {
                Text(restaurant.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(restaurant.cuisine)
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                // Metrics (Rating, Time, Cost)
                HStack(spacing: 6) {
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                            .font(.caption2)
                            .foregroundColor(.orange)
                        Text(String(format: "%.1f", restaurant.rating))
                            .font(.caption.bold())
                    }
                    
                    Text("•")
                        .foregroundColor(.secondary)
                        .font(.caption2)
                    
                    Text(restaurant.deliveryTime)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Text("•")
                        .foregroundColor(.secondary)
                        .font(.caption2)
                    
                    Text(restaurant.priceForTwo)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding(.top, 2)
            }
            
            Spacer()
        }
        .padding(12)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(color: .black.opacity(0.04), radius: 6, y: 3)
    }
}

// MARK: - Preview
#Preview {
    HomeView()
}
