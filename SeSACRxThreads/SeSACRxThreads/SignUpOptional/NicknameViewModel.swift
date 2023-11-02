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
    
    func nicknameValidation(completion: @escaping (Bool) -> Void) {
        nickname
            .observe(on: MainScheduler.instance)
            .map { $0.count >= 2 && $0.count < 6 }
            .subscribe(with: self) { owner, bool in
                completion(bool)
                owner.buttonHidden.onNext(!bool)
            }
            .disposed(by: disposeBag)
    }
}
