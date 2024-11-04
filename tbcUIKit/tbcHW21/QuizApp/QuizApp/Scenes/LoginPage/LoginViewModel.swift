//
//  LoginViewModel.swift
//  QuizApp
//
//  Created by Apple on 03.11.24.
//

import Foundation

class LoginViewModel {
    
    var username: String = ""
    var password: String = ""
    var confirmPassword: String = ""
    
    var loginAction: (() -> Void)?
    var showEmptyAlert: (() -> Void)?
    var showMacdAlert: (() -> Void)?
    
    func loginButtonTapped() {
        if username.isEmpty || password.isEmpty || confirmPassword.isEmpty {
            showEmptyAlert?()
        } else if password != confirmPassword {
            showMacdAlert?()
        } else {
            // მომხმარებლის სტატუსის შენახვა UserDefaults-ში
            UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
            loginAction?()
        }
    }
}

