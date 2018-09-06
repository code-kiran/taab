//
//  ViewController.swift
//  taab
//
//  Created by kiran on 9/3/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func gotoTab(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "tab") as? BaseTabBarController {
        present(vc, animated: true, completion: nil)
    }
}

}
