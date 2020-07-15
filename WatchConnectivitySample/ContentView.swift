//
//  ContentView.swift
//  WatchConnectivitySample
//
//  Created by 今井幸宣 on 2020/07/15.
//  Copyright © 2020 yukinobu.imai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var connector = WatchConnector()
    
    var body: some View {
        VStack {
            HStack {
                Text("\(connector.count)")
                Button(action: { self.connector.send() }) { Text("送信") }
            }
            Text("\(self.connector.receivedMessage)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
