//
//  LoginView.swift
//  FoodDeliverApp
//
//  Created by Olive Mac4 on 08/09/26.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @State private var isNavigateToHome = false
    var body: some View {
        NavigationStack {
            VStack {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70,height: 70)
                    .padding(15)
                Text("Foodie")
                    .fontWeight(.bold)
                Text("Good Food Brings Good Mood")
                    .multilineTextAlignment(.center)
                    .font(Font.system(size: 10))
                    .fontWeight(.regular)
                
                VStack(alignment: .center, spacing: 12) {
                    TextField("Email", text: $viewModel.email)
                        .textInputAutocapitalization(.never)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(height: 50)
                        .padding(.horizontal , 20)
                    
                    TextField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(height: 50)
                        .padding(.horizontal , 20)
                        .padding(.bottom,20)
                    
                    Button(action: {
                        Task {
                            await viewModel.login()
                            isNavigateToHome = true
                            
                        }
                    }, label: {
                        Text("Login")
                    })
                    .frame(width: 350 ,height: 45)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    
                    .background(Color.orange)
                    //Spacer()
                    HStack{
                        Text("Dont have an account?")
                        Button(action: {
                        }, label: {
                            Text("Sign in")
                        })
                        
                    }
                    Spacer()
                }
            }
            .navigationDestination(isPresented: $isNavigateToHome) {
                HomeView()
            }
            
            .padding(.top, 50)
        }
    }
}

#Preview {
    LoginView()
}
