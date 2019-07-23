//
//  ViewController.swift
//  MyNewworkLayer
//
//  Created by Adam on 7/23/19.
//  Copyright © 2019 Adam. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    func callNetworkLayer()  {
        UserRouter.login(email: "", password: "").sendNative(justModle.self) { (response) in
            switch response {
            case .failure(let error):
                // TODO: - Handle error as you want, printing isn't handling.
                print(error!)
            case .success(let value):
                print(value.self)
                
                
                // if  response has image
                let url = URL(string: "https://example.com/image.png")
                self.imageView.kf.setImage(with: url)
                
            }
        }
    }
    

    
   

}

// Example Model

class justModle:  Codable, CodableInit {
    
}
