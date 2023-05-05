//
//  SplashView.swift
//  Calendar_SwiftUI
//
//  Created by Kazusa Kondo on 2023/05/03.
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject var route: RouteObserver
    @EnvironmentObject var setting: Setting
    let splashTime: TimeInterval = 3.0
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("スプラッシュ画面です!")
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        //.background(Color.anthracite)
        //ビューが画面の安全エリアを無視して表示されるように指定するための処理
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            // 一定時間後にスプラッシュ画面からホーム画面に遷移するための処理
            DispatchQueue.main.asyncAfter(deadline: .now() + splashTime) {
                setting.isLoading = false
                //route.path = .Loading
                route.path = .Calendar
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

