//
//  LoginViewController.swift
//  KVO
//
//  Created by Frank Huang on 2018/11/3.
//  Copyright © 2018 Frank. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @objc let logicController = LoginLogicController()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    deinit {
        removeObserver(self, forKeyPath: #keyPath(logicController.status), context: nil)
    }
}

// MARK: - View life cycle

extension LoginViewController {

    override func viewDidLoad() {

        super.viewDidLoad()

        addObserver(self, forKeyPath: #keyPath(logicController.status), options: [.old, .new], context: nil)
    }

    override func viewDidAppear(_ animated: Bool) {

        super.viewDidAppear(animated)

        pressLoginButton()
    }
}

// MARK: - Actions

extension LoginViewController {

    func pressLoginButton() {

        logicController.login()
    }
}

// MARK: - KVO

extension LoginViewController {

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {

        guard let keyPath = keyPath else {
            return
        }

        if keyPath == #keyPath(logicController.status) {
            
            switch logicController.status {
            case .NotLogin: print("Not login")
            case .Loginning: print("Loginning")
            case .Loginned: print("Loginned")
            }
        }
    }
}

