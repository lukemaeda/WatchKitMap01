//
//  ViewController.swift
//  WatchKitMap01
//
//  Created by MAEDAHAJIME on 2015/04/12.
//  Copyright (c) 2015年 MAEDAHAJIME. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 位置情報へのアクセスを要求する
        locationManager.requestAlwaysAuthorization()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

