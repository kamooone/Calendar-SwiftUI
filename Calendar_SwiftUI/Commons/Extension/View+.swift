//
//  View+.swift
//  Calendar_SwiftUI
//
//  Created by Kazusa Kondo on 2023/05/03.
//

import Foundation
import SwiftUI

///SwiftUIのViewプロトコルに拡張機能を追加
extension View{
    
    ///Viewに色を適用するためのメソッド
    ///使い方は、SwiftUIのビューを作成しているときに、".color()"というメソッドを呼び出す
    ///例1.Text("Hello, World!").color(.blue, 0.8)
    ///引数の透明度は省略可能で、省略された場合は透明度1.0がデフォルトで使用されます
    ///例2.Text("Hello, World!").color(.blue)
    func color(_ color: Color, _ opacity: CGFloat = 1) -> some View{
        return self.foregroundColor(color.opacity(opacity))
    }
    
    ///matchParentWidth() と matchParentHeight() メソッドを呼び出して、ビューの幅と高さを親ビューに合わせます。つまり、ビューは親ビューのサイズと同じサイズになります
    func matchParentSize() -> some View{
        self.matchParentWidth()
            .matchParentHeight()
    }
    
    ///ビューの幅を親ビューに合わせます。frame() メソッドを使用して、ビューの最小幅を0、最大幅を無限に設定しています
    func matchParentWidth() -> some View{
        self.frame(minWidth: 0, maxWidth: .infinity)
    }
    
    ///ビューの高さを親ビューに合わせます。frame() メソッドを使用して、ビューの最小高さを0、最大高さを無限に設定しています
    func matchParentHeight() -> some View{
        self.frame(minHeight: 0, maxHeight: .infinity)
    }
}
