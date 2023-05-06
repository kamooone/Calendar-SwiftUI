//
//  CalenderViewModel.swift
//  Calendar_SwiftUI
//
//  Created by Kazusa Kondo on 2023/05/05.
//

import SwiftUI

struct CalendarViewModel: UIViewRepresentable {
    ///クロージャーを保持するために使用されます。このクロージャーは、カレンダービューで日付が選択されたときに、選択された日付の DateComponents を引数として呼び出されます。つまり、このクロージャーは、日付が選択された際に実行する処理を指定するために使用されます。
    let didSelectDate: (_ dateComponents: DateComponents) -> Void
    
    final public class Coordinator: NSObject, UICalendarSelectionSingleDateDelegate {
        
        ///didSelectDateというクロージャを定義しています。このクロージャは、引数として dateComponents を受け取り、戻り値はありません。このクロージャは、Coordinator のインスタンスが初期化されるときに渡され、後でカレンダービューで日付が選択されたときに、選択された日付の dateComponents を引数として呼び出されます。つまり、このクロージャは、日付が選択されたときに呼び出されるコールバック関数のようなものです。
        let didSelectDate: (_ dateComponents: DateComponents) -> Void
        
        ///このクロージャーは、日付が選択された際に実行される処理を指定するために用意されています。引数の didSelectDate には、渡されたクロージャーが代入されます。Coordinator クラスのインスタンスが生成された際に、このクロージャーが指定された日付が選択された場合に呼び出されるようになります。
        init(
            didSelectDate: @escaping (_ dateComponents: DateComponents) -> Void
        ) {
            self.didSelectDate = didSelectDate
        }
        
        ///UICalendarSelectionSingleDateDelegateプロトコルに定義されているメソッドです。このメソッドは、UICalendarSelectionSingleDateオブジェクト内で日付が選択された場合に呼び出されます。このメソッドは、選択された日付を表すDateComponentsオブジェクトを引数に受け取り、その日付を処理するために使用できます。
        public func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
            guard let dateComponents = dateComponents else {
                return
            }
            didSelectDate(dateComponents)
        }
    }
    
    ///UIViewRepresentable プロトコルを実装するカスタムビューのインスタンスが作成されたときに呼び出されます。このメソッドは、このカスタムビューのコントローラオブジェクトを作成するために使用されます。返されたオブジェクトは、カスタムビューのライフサイクルを管理するために使用されます。具体的には、UIKitオブジェクトとSwiftUIオブジェクトの間の通信を処理するのに使用されます。このような通信は、Coordinatorを使用して行われます。例えば、カスタムビューのインスタンスがUIKitのスクロールビューのサブビューとして使用される場合、Coordinatorは、スクロールビューのスクロール位置をカスタムビューに伝えるために使用されます。
    public func makeCoordinator() -> Coordinator {
        Coordinator(didSelectDate: didSelectDate)
    }
    
    ///表示するViewの初期状態のインスタンスを生成するメソッドです。SwiftUIの中で使用したいUIKitのViewを戻り値として返却します。このメソッドは最初の一回しか呼び出されず、ビューを更新する場合はupdateUIViewメソッドに処理を定義します。
    func makeUIView(context: Context) -> some UIView {
        let selection = UICalendarSelectionSingleDate(delegate: context.coordinator)
        
        let calendarView = UICalendarView()
        calendarView.selectionBehavior = selection
        return calendarView
    }
    
    ///表示するビューの状態が更新されるたびに呼び出され更新を反映させるためのメソッドです。例えばUIViewRepresentableプロトコルに準拠させた構造体のプロパティなどが変更された時などに呼び出されます。
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarViewModel { dateComponents in
            
        }
    }
}
