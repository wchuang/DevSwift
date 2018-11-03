//
//  LoginLogicController.swift
//  KVO
//
//  Created by Frank Huang on 2018/11/3.
//  Copyright © 2018 Frank. All rights reserved.
//

import Foundation

@objc public enum LoginStatus: Int {

    case NotLogin = 0, Loginning, Loginned
}

class LoginLogicController: NSObject {

    @objc dynamic var status: LoginStatus = .NotLogin
}

// MARK: - Actions

extension LoginLogicController {

    func login() {

        status = .Loginning

        // Mock waiting the response of login API
        let delayInSeconds = 3.0
        DispatchQueue.main.asyncAfter(deadline: .now() + delayInSeconds, execute: { [weak self] in

            guard let self = self else {
                return
            }

            self.status = .Loginned
        })
    }
}
