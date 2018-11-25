//
//  ViewController.swift
//  CustomDecode
//
//  Created by Frank Huang on 2018/11/25.
//  Copyright © 2018 Frank. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    struct Dog : Decodable {
        let name : String
        let breed : String
    }

    struct DogResponse : Decodable {
        let dogs : [Dog]
        let dogInfo : [String: Dog]

        private enum CodingKeys: String, CodingKey {
            case data = "Data"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            let data = try values.decode([String : Dog].self, forKey: .data)
            dogs = Array(data.values)
            dogInfo = data
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        decode()
    }
}

extension ViewController {

    func decode() {

        let data = ["Response": "success",
                    "BaseLinkUrl": "https://wwww.example.com",
                    "Data": ["Max": ["name": "Max", "breed": "Labrador"],
                             "Rocky": ["name": "Max2", "breed": "Labrador2"]]] as [String : Any]

        do {

            let encodedData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)

            let dogResponse = try JSONDecoder().decode(DogResponse.self, from: encodedData)

            print(dogResponse.dogs)
            print(dogResponse.dogInfo)

        } catch {

            print(error.localizedDescription)
        }
    }
}

