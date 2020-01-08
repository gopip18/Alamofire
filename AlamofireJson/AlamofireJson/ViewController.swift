//
//  ViewController.swift
//  AlamofireJson
//
//  Created by apple on 07/01/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire

struct nameDtl:Decodable {
    var contacts:[ContDtl]
}

struct ContDtl:Decodable {
    var name:String
    var email:String
}

class ViewController: UIViewController {

    var getDtl = [ContDtl]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlOne = URL(string: "https://api.androidhive.info/contacts/")
        let urlAlamo = URLRequest(url: urlOne!)

        Alamofire.request(urlAlamo).responseJSON {(responSe) in
            
            if let result = responSe.data {
            print(result)
            
        let downLoad = try! JSONDecoder().decode(nameDtl.self, from: result)
          self.getDtl = downLoad.contacts
                print(self.getDtl[0].email)
        
        }
        }
        
    }


}

