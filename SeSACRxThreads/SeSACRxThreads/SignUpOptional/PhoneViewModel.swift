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
    
    func validationPhone(completion: @escaping (Bool) -> Void) {
        phone
            .observe(on: MainScheduler.instance)
            .map { $0.count > 10 }
            .subscribe(with: self) { owner, bool in
                completion(bool)
                owner.buttonEnabled.onNext(bool)
            }
            .disposed(by: disposeBag)
    }
}
