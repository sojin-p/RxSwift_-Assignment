//
//  BirthdayViewModel.swift
//  SeSACRxThreads
//
//  Created by 박소진 on 2023/11/02.
//

import Foundation
import RxSwift

class BirthdayViewModel {
    
    let birthday: BehaviorSubject<Date> = BehaviorSubject(value: .now)
    let year = BehaviorSubject(value: 1996)
    let month = BehaviorSubject(value: 01)
    let day = BehaviorSubject(value: 29)
    let buttonEnabled = BehaviorSubject(value: false)
    
    let disposeBag = DisposeBag()
    
    init() {
        birthday
            .observe(on: MainScheduler.instance)
            .subscribe(with: self) { owner, date in
                let component = Calendar.current.dateComponents([.year, .month, .day], from: date)
                owner.year.onNext(component.year ?? 0)
                owner.month.onNext(component.month ?? 0)
                owner.day.onNext(component.day ?? 0)
            }
            .disposed(by: disposeBag)
    }
    
}
