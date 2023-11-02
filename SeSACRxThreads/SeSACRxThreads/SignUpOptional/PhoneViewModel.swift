//
//  PhoneViewModel.swift
//  SeSACRxThreads
//
//  Created by 박소진 on 2023/11/02.
//

import Foundation
import RxSwift

class PhoneViewModel {
    
    let phone = BehaviorSubject(value: "010111111")
    let buttonEnabled = BehaviorSubject(value: false)
    
    let disposeBag = DisposeBag()
    
    init() {
        formattedPhone()
        validationPhone()
    }
    
    func validationPhone() {
        phone
            .observe(on: MainScheduler.instance)
            .map { $0.count > 10 }
            .subscribe(with: self) { owner, bool in
                owner.buttonEnabled.onNext(bool)
            }
            .disposed(by: disposeBag)
    }
    
    func formattedPhone() {
        phone
            .observe(on: MainScheduler.instance)
            .subscribe(with: self) { owner, text in
                let result = text.formated(by: "###-####-####")
                owner.phone.onNext(result)
            }
            .disposed(by: disposeBag)
    }
}
