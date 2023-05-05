//
//  CalendarView.swift
//  Calendar_SwiftUI
//
//  Created by Kazusa Kondo on 2023/05/05.
//

import SwiftUI

struct CalendarView: View {
    var body: some View {
        print("カレンダー画面！")
        CalendarViewModel { dateComponents in
            guard let year = dateComponents.year,
                  let month = dateComponents.month,
                  let day = dateComponents.day else {
                return
            }
            print("yate: \(year), month: \(month), day: \(day)")
        }
    }
}
