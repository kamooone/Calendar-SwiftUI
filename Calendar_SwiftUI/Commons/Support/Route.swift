//
//  File.swift
//  Calendar_SwiftUI
//
//  Created by Kazusa Kondo on 2023/04/30.
//

import Foundation
import SwiftUI

class RouteObserver: ObservableObject{
    @Published var path = Route.Loading
        
    @Published var fromSchemeUrl = false
    @Published var schemeUrl = URL(string: "")
}

public enum Route{
    case Loading
    case Calendar
}

