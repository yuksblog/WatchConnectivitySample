//
//  PhoneConnector.swift
//  WatchConnectivitySample WatchKit Extension
//
//  Created by 今井幸宣 on 2020/07/15.
//  Copyright © 2020 yukinobu.imai. All rights reserved.
//

import UIKit
import WatchConnectivity

class PhoneConnector: NSObject, ObservableObject, WCSessionDelegate {
    
    @Published var receivedMessage = "PHONE : 未受信"
    
    @Published var count = 0
    
    override init() {
        super.init()
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("activationDidCompleteWith state= \(activationState.rawValue)")
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("didReceiveMessage: \(message)")
        
        DispatchQueue.main.async {
            self.receivedMessage = "PHONE : \(message["PHONE_COUNT"] as! Int)"
        }
    }
    
    func send() {
        if WCSession.default.isReachable {
            count += 1
            WCSession.default.sendMessage(["WATCH_COUNT" : count], replyHandler: nil) { error in
                print(error)
            }
        }
    }
    
}
