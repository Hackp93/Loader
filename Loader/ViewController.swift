//
//  ViewController.swift
//  Loader
//
//  Created by Manu Singh on 08/04/19.
//  Copyright © 2019 Manu Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickShowLoader(_ sender : UIButton){
        showLoader(with: "Hello There! If you are seeing animation this means loader is working")
        
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false, block: {
            timer in
            self.hideLoader()
        })
    }


}

