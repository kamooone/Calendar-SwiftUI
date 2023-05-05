//
//  CalenderViewModel.swift
//  Calendar_SwiftUI
//
//  Created by Kazusa Kondo on 2023/05/05.
//

import SwiftUI

struct CalendarViewModel: UIViewRepresentable {
    let didSelectDate: (_ dateComponents: DateComponents) -> Void
    
    final public class Coordinator: NSObject, UICalendarSelectionSingleDateDelegate {
        let didSelectDate: (_ dateComponents: DateComponents) -> Void
        
        init(
            didSelectDate: @escaping (_ dateComponents: DateComponents) -> Void
        ) {
            self.didSelectDate = didSelectDate
        }
        
        public func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
            guard let dateComponents = dateComponents else {
                return
            }
            didSelectDate(dateComponents)
        }
    }
    
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(didSelectDate: didSelectDate)
    }
    
    
    func makeUIView(context: Context) -> some UIView {
        let selection = UICalendarSelectionSingleDate(delegate: context.coordinator)
        
        let calendarView = UICalendarView()
        calendarView.selectionBehavior = selection
        return calendarView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarViewModel { dateComponents in
            
        }
    }
}
