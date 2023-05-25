//
//  CalendarView.swift
//  Calendar_SwiftUI
//
//  Created by Kazusa Kondo on 2023/05/05.
//

import SwiftUI

struct CalendarView: View {
    
    let calendarViewModel = CalendarViewModel.shared
    
    let dayofweek = ["日", "月", "火", "水", "木", "金", "土"]
    let cornerRadius: CGFloat = 5
    let columns: CGFloat = 8
    let rows: CGFloat = 9
    
    @State var firstDayWeek: Weekday = Weekday.monday
    @State var numDaysMonth: Int = 0
    @State var currentMonth: Int = 0
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack() {
                    
                    Button(action: {
                        // ToDo 月が1未満になったら12月になるようにして、年数を一つ下げる
                        currentMonth -= 1
                        bindViewModel()
                    }){
                        Text("◀︎")
                            .font(.system(size: 20))
                    }
                    .offset(x: 0, y: 60)
                    Text("\(String(calendarViewModel.year))年\(calendarViewModel.month + currentMonth)月")
                        .font(.system(size: 20))
                        .offset(x: 0, y: 60)
                    
                    Button(action: {
                        // ToDo 月が12以上になったら1月になるようにして、年数を一つ上げる
                        currentMonth += 1
                        bindViewModel()
                    }){
                        Text("▶︎")
                            .font(.system(size: 20))
                    }
                    .offset(x: 0, y: 60)
                }
                HStack() {
                    ForEach(self.dayofweek, id: \.self) { day in
                        ZStack {
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .frame(width: geometry.size.width / columns, height: geometry.size.height / rows)
                                .foregroundColor(Color.clear) // 今のところは表示の必要がないため透明にする
                                .offset(x: 0, y: 30)
                            HStack {
                                Spacer().frame(width: 20)
                                Text(day)
                                    .font(.system(size: 16))
                                    .foregroundColor(day == "土" ? Color.blue : (day == "日" ? Color.red : Color.black))
                                    .offset(x: 0, y: 30)
                                Spacer().frame(width: 20)
                            }
                        }
                    }
                }
                
                //7*6のマスを表示する
                ForEach(0..<6, id: \.self) { week in
                    ZStack {
                        HStack(spacing: 0) {
                            ForEach(0..<7, id: \.self) { _ in
                                Rectangle()
                                    .stroke(Color.black)
                                    .frame(width: geometry.size.width / columns, height: geometry.size.height / rows)
                            }
                        }
                        
                        HStack(spacing: 0) {
                            ForEach(1..<8, id: \.self) { i in
                                if ((i+week*7) - firstDayWeek.rawValue <= 0) {
                                    Text("")
                                        .frame(width: geometry.size.width / columns, height: geometry.size.height / rows)
                                } else if ((i+week*7) - firstDayWeek.rawValue > numDaysMonth) {
                                    Text("")
                                        .frame(width: geometry.size.width / columns, height: geometry.size.height / rows)
                                } else {
                                    Text("\(i + (week*7) - firstDayWeek.rawValue)")
                                        .frame(width: geometry.size.width / columns, height: geometry.size.height / rows)
                                        .foregroundColor((i+week*7) == 1 || (i+week*7) == 8 || (i+week*7) == 15 || (i+week*7) == 22 || (i+week*7) == 29 || (i+week*7) == 36 ? Color.red : ((i+week*7) == 7 || (i+week*7) == 14 || (i+week*7) == 21 || (i+week*7) == 28 || (i+week*7) == 35 ? Color.blue : Color.black))
                                        .offset(x: 0, y: -30)
                                }
                            }
                        }
                        
                        // カレンダーのセルに文字を表示させる場合
//                        HStack(spacing: 0) {
//                            ForEach(1..<8, id: \.self) { i in
//                                if ((i+week*7) - firstDayWeek.rawValue <= 0) {
//                                    Text("")
//                                        .frame(width: geometry.size.width / columns, height: geometry.size.height / rows)
//                                } else if ((i+week*7) - firstDayWeek.rawValue > numDaysMonth) {
//                                    Text("")
//                                        .frame(width: geometry.size.width / columns, height: geometry.size.height / rows)
//                                } else {
//                                    Text("aaaa")
//                                        .frame(width: geometry.size.width / columns, height: geometry.size.height / rows)
//                                        .offset(x: 0, y: 10)
//                                }
//                            }
//                        }
                        
                    }
                    .padding(.bottom, -8) // 行間のスペースを削除するために負の余白を設定
                }
                
            }
            .onAppear {
                bindViewModel()
            }
        }
    }
}

extension CalendarView {
    func bindViewModel() {
        firstDayWeek = calendarViewModel.dayOfWeekCalc(year: calendarViewModel.year, month: calendarViewModel.month + currentMonth,  day: 1)
        
        numDaysMonth = calendarViewModel.dayNumber(year: calendarViewModel.year, month: calendarViewModel.month + currentMonth)
    }
}
