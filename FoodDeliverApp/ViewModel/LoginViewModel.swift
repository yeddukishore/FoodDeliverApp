//
//  LoginViewModel.swift
//  FoodDeliverApp
//
//  Created by Olive Mac4 on 08/09/26.
//

import Foundation
import Combine

final class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var isLoginSuccess = false
    @Published var errorMessage: String?
    
    private let authService = AuthService()
    
    func login() async {
        isLoading = true
        errorMessage = nil

        do {
            let success = try await authService.login(
                email: email,
                password: password
            )

            isLoginSuccess = success

            if success {
                print("✅ Login Success")
            } else {
                print("❌ Login Failed")
            }

        } catch {
            print("❌ Login Failed: \(error)")
            errorMessage = "Invalid email or password"
        }

        isLoading = false
    }
    
}

