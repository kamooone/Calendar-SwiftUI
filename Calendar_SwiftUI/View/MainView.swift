//
//  ContentView.swift
//  Calendar_SwiftUI
//
//  Created by Kazusa Kondo on 2023/04/30.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var route: RouteObserver
    @EnvironmentObject var setting: Setting
    
    var body: some View {
        ZStack{
            if(setting.isLoading){
                //LoadingView()
            }
            
            switch route.path {
            case .Splash:
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("wo")
            }
        }
    }
}

struct LoadingView: View{
    ///引数でmessageを指定した場合はそちらが優先される
    var message = "loading"//.localized()
    
    var body: some View {
        VStack{
            //Text(message).color(.red)
            ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .white))
                .frame(width: 50, height: 50)
                .color(.white)
        }
            //値が大きいほど前面(z軸)に表示される
            .zIndex(1)
            .matchParentSize()
            .background(Color.black.opacity(0.5))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(RouteObserver()).environmentObject(Setting())
    }
}
