//
//  ContentView.swift
//  Calendar_SwiftUI
//
//  Created by Kazusa Kondo on 2023/04/30.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var route: RouteObserver
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(RouteObserver())
    }
}
