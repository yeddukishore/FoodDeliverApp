//
//  AuthService.swift
//  FoodDeliverApp
//
//  Created by Olive Mac4 on 15/09/26.
//

import Foundation

final class AuthService {
    func login(email: String, password: String) async throws -> Bool {
        // Dummy API delay
        try await Task.sleep(for: .seconds(1))
        if email == "test@gmail.com" && password == "123456" {
            return true
        }

        throw LoginError.invalidCredentials
    }
}

enum LoginError: Error {
    case invalidCredentials
}
