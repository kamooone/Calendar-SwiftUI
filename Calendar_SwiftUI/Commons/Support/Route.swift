//
//  File.swift
//  Calendar_SwiftUI
//
//  Created by Kazusa Kondo on 2023/04/30.
//

import Foundation
import SwiftUI

class RouteObserver: ObservableObject{
    @Published var path = Route.Splash
        
    @Published var fromSchemeUrl = false
    @Published var schemeUrl = URL(string: "")
}

public enum FinishType {
    case Breakout
    case Kick
    case Lecture
}

public enum Route{
    case Splash
    case Login
    case Home(userId: String)
    case Waitting(lectureId: Int, lectureNickname: String)
    case Game(lectureId: Int)
}

