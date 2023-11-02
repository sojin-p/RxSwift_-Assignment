//
//  NicknameViewModel.swift
//  SeSACRxThreads
//
//  Created by 박소진 on 2023/11/02.
//

import Foundation
import RxSwift

class NicknameViewModel {
    
    let nickname = PublishSubject<String>()
    let buttonHidden = BehaviorSubject(value: true)
    let disposeBag = DisposeBag()
    
    init() {
        nicknameValidation()
    }
    
    func nicknameValidation() {
        nickname
            .observe(on: MainScheduler.instance)
            .map { $0.count >= 2 && $0.count < 6 }
            .subscribe(with: self) { owner, bool in
                owner.buttonHidden.onNext(!bool)
            }
            .disposed(by: disposeBag)
    }
}
