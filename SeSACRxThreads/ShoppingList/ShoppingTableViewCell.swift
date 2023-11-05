//
//  ShoppingTableViewCell.swift
//  SeSACRxThreads
//
//  Created by 박소진 on 2023/11/04.
//

import UIKit

final class ShoppingTableViewCell: UITableViewCell {
    
    static let identifier = "ShoppingTableViewCell"
    
    let containerView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 10
        return view
    }()
    
    let checkboxButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "square"), for: .normal)
        view.tintColor = .black
        return view
    }()
    
    let listLabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 15, weight: .light)
        view.textColor = .black
        return view
    }()
    
    let likeButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "star"), for: .normal)
        view.tintColor = .black
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        [containerView].forEach { contentView.addSubview($0) }
        [checkboxButton, listLabel, likeButton].forEach { containerView.addSubview($0) }
    }
    
    private func setConstraints() {
        
        containerView.snp.makeConstraints { make in
            make.verticalEdges.equalTo(contentView).inset(2)
            make.horizontalEdges.equalTo(contentView).inset(20)
        }
        
        checkboxButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.size.equalTo(40)
            make.leading.equalTo(20)
        }
        
        listLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(checkboxButton.snp.trailing).offset(12)
            make.trailing.equalTo(likeButton.snp.leading).offset(-8)
        }
        
        likeButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(20)
            make.size.equalTo(40)
        }
    }
}
