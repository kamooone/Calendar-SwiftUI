//
//  AppSetting.swift
//  Calendar_SwiftUI
//
//  Created by Kazusa Kondo on 2023/05/02.
//

import Foundation

class Setting: ObservableObject{
        
    /// Loading view
    @Published var isLoading = true
    
    /// Disable screen touch
    @Published var isEnableLeftMenu = false
}
