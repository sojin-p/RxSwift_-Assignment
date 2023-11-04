//
//  SearchViewModel.swift
//  SeSACRxThreads
//
//  Created by 박소진 on 2023/11/04.
//

import Foundation
import RxSwift

class SearchViewModel {
    
    var data = ["a", "b", "c", "d", "addad", "babbdba", "ccdsvda"]
    lazy var items = BehaviorSubject(value: data)
    
    func insertData(text: String) {
        data.insert(text, at: 0)
        items.onNext(data)
    }
    
    func filterData(text: String) {
        let result = text == "" ? data : data.filter { $0.contains(text) }
        items.onNext(result)
    }
}
