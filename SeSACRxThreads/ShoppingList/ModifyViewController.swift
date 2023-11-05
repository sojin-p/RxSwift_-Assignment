//
//  ModifyViewController.swift
//  SeSACRxThreads
//
//  Created by 박소진 on 2023/11/05.
//

import UIKit
import RxSwift
import RxCocoa

final class ModifyViewController: UIViewController {
    
    let textField = {
        let view = UITextField()
        view.placeholder = "할일을 입력해 주세요."
        return view
    }()
    
    var data: String?
    lazy var item = BehaviorSubject(value: data)

    let disposeBag = DisposeBag()
    
    var completion: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setSheet()
        configure()
        setConstraints()
        textField.becomeFirstResponder()
        
        bind()
    }
    
    func bind() {
        
        item
            .bind(to: textField.rx.text)
            .disposed(by: disposeBag)
        
        textField.rx.controlEvent(.editingDidEndOnExit)
            .withLatestFrom(textField.rx.text.orEmpty, resultSelector: { _, text in
                return text
            })
            .subscribe(with: self) { owner, text in
                print("====리턴키?", text)
                owner.completion?(text)
                owner.dismiss(animated: true)
            }
            .disposed(by: disposeBag)
        
    }
    
    func setSheet() {
        if let sheet = sheetPresentationController {
            sheet.animateChanges {
                sheet.detents = [.custom(resolver: { context in
                    80
                })]
                sheet.prefersScrollingExpandsWhenScrolledToEdge = false
                sheet.preferredCornerRadius = 20
            }
        }
    }
    
    func configure() {
        view.addSubview(textField)
    }
    
    func setConstraints() {
        textField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.horizontalEdges.equalToSuperview().inset(30)
            make.height.equalTo(60)
        }
    }
}
