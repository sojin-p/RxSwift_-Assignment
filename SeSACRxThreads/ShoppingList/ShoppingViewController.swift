//
//  ShoppingViewController.swift
//  SeSACRxThreads
//
//  Created by 박소진 on 2023/11/04.
//

import UIKit
import SnapKit

final class ShoppingViewController: UIViewController {
    
    let containerView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 10
        return view
    }()
    
    let textField = {
        let view = UITextField()
        view.backgroundColor = .clear
        view.clearButtonMode = .whileEditing
        view.placeholder = "무엇을 구매하실 건가요?"
        return view
    }()
    
    let addButton = {
        let view = UIButton()
        view.setTitle("추가", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 10
        return view
    }()
    
    let tableView: UITableView = {
        let view = UITableView()
        view.register(ShoppingTableViewCell.self, forCellReuseIdentifier: ShoppingTableViewCell.identifier)
        view.backgroundColor = .white
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "쇼핑"
        configure()
        setConstraints()
    }
    
    private func configure() {
        [containerView, tableView].forEach { view.addSubview($0) }
        [textField, addButton].forEach { containerView.addSubview($0) }
    }
    
    private func setConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(70)
        }
        
        addButton.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.width.equalTo(60)
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
        }
        
        textField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalTo(addButton.snp.leading).offset(-10)
            make.centerY.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.bottom).offset(20)
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}
