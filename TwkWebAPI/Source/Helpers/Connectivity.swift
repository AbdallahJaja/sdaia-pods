//
//  Connectivity.swift
//  Tawakkalna
//
//  Created by Aziz Dev on 05/04/2020.
//  Copyright © 2020 Ministry of Health. All rights reserved.
//

import UIKit
import Alamofire

extension Notification.Name {
    static let reachablityChanged = Notification.Name("KM_reachablityChanged")
}

class Connectivity: NSObject {
    
    public static let shared = Connectivity()
    
    var didFailToUnlockChallenge: Bool = false
    var didUnlockChallenge: Bool = false
    var unlockServicesIn: TimeInterval = 0
    var allowRefreshIn: TimeInterval = 0
    let refreshLimit = 20.0
    var unlockQoutaServicesIn: TimeInterval = 0

    lazy var networkManager: NetworkReachabilityManager? = {
		return NetworkReachabilityManager()
    }()
    
    override init () {

        super.init()
        self.comminInit()
    }
    
    static var isConnectedToInternet: Bool {
        
        let manager = NetworkReachabilityManager()
        return manager?.isReachable ?? false
    }
    
    func comminInit(){

        self.networkManager?.startListening(onUpdatePerforming: { (status) in
            print(status)
            NotificationCenter.default.post(name: .reachablityChanged, object: status)
            switch status{
            case .reachable:
                print("Reachable")
            default:
                print("Not Reachable")
            }
        })
    }

    func isAllowedForRefresh() -> Bool {
        
        let timeStamp = Date().timeIntervalSince1970
        if self.allowRefreshIn > timeStamp
        {
            if (self.allowRefreshIn - timeStamp > refreshLimit){
                //this mabye because the user changed the time
            }else{
                return false
            }
        }
        self.allowRefreshIn = Date().addingTimeInterval(20).timeIntervalSince1970 // 20 sec
        return true
    }
    
    class func isVPNConnected() -> Bool {
      
        guard let cfDict = CFNetworkCopySystemProxySettings() else{
            return false
        }
        let nsDict = cfDict.takeRetainedValue() as NSDictionary
        
        guard let keys = nsDict["__SCOPED__"] as? NSDictionary else{
            return false
        }
        
        guard let allKeys = keys.allKeys as? [String] else {
            return false
        }
        
        //let interfaces = ["tap","tun","ppp","ipsec","ipsec0"]
        for originalkey in allKeys {
            //if interfaces.contains(key) { return true }
            let key = originalkey.lowercased()
            if (key.contains("tap")  || key.contains("tun")   ||
                key.contains("ppp")  || key.contains("ipsec") ||
                key.contains("ikev") || key.contains("sstp")  ||
                key.contains("openvpn")) {
                return true
            }
        }
        return false
    }
    
}
