//
//  Calendar_SwiftUIApp.swift
//  Calendar_SwiftUI
//
//  Created by Kazusa Kondo on 2023/04/30.
//

import SwiftUI

@main
struct Calendar_SwiftUIApp: App {
    @StateObject var route = RouteObserver()
    @StateObject var setting = Setting()
    
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(route).environmentObject(setting)
        }
    }
}
