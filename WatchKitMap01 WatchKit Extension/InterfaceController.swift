//
//  InterfaceController.swift
//  WatchKitMap01 WatchKit Extension
//
//  Created by MAEDAHAJIME on 2015/04/12.
//  Copyright (c) 2015年 MAEDAHAJIME. All rights reserved.
//

import WatchKit
import Foundation
import CoreLocation

// 接続 Delegate設定
class InterfaceController: WKInterfaceController, CLLocationManagerDelegate {

    // 地図
    @IBOutlet weak var map: WKInterfaceMap!
    
    var locationManager = CLLocationManager()
    
    override init() {
        super.init()
        
        // delegate ON
        locationManager.delegate = self
        
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .AuthorizedAlways, .AuthorizedWhenInUse:
                
                // 座標の表示
                locationManager.startUpdatingLocation()
                
                break
            default:
                break
            }
        }
    }
    
    //  座標の指定
    func locationManager(manager: CLLocationManager!, didUpdateToLocation newLocation: CLLocation!, fromLocation oldLocation: CLLocation!) {
        
        // newLocation 経度
        let lat = newLocation.coordinate.latitude
        // newLocation 緯度
        let lng = newLocation.coordinate.longitude
        
        // 座標の指定
        let coordinate = CLLocationCoordinate2DMake(lat, lng)
        // 領域範囲
        let span = MKCoordinateSpanMake(1.0, 1.0)
        
        let region = MKCoordinateRegionMake(coordinate, span)
        map.setRegion(region)
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
