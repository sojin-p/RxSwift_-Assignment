//
//  ShoppingViewModel.swift
//  SeSACRxThreads
//
//  Created by 박소진 on 2023/11/05.
//

import Foundation
import RxSwift

final class ShoppingViewModel {
    
    var data = ["하하ㅏㅎ", "123", "ㅁㅇㄴㅇ", "ㅁㄴㄹ4ㄷㅈㄹㅎㄷ"]
    lazy var items = BehaviorSubject(value: data)
    
    func insertData(text: String) {
        data.insert(text, at: 0)
        items.onNext(data)
    }
    
    func updateData(at index: Int, text: String) {
        data.remove(at: index)
        data.insert(text, at: index)
        items.onNext(data)
    }
    
    func removeData(at index: Int) {
        data.remove(at: index)
        items.onNext(data)
    }
    
}
