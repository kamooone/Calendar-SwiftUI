//
//  CalendarView.swift
//  Calendar_SwiftUI
//
//  Created by Kazusa Kondo on 2023/05/05.
//

import SwiftUI

struct CalendarView: View {
    var body: some View {
        CalendarViewModel { dateComponents in
            print("カレンダー画面!")
            // dateSelectionメソッドで取得した年月日を受け取る。
            guard let year = dateComponents.year,
                  let month = dateComponents.month,
                  let day = dateComponents.day else {
                return
            }
            print("yate: \(year), month: \(month), day: \(day)")
            print("カレンダー内の日付をタップしたらその年月日が取得される。")
        }
    }
}
