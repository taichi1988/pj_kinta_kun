//
//  ShadowButton.swift
//  pj_kinta_kun
//
//  Created by 行木太一 on 2017/12/25.
//  Copyright © 2017年 ManhattanCode.Inc. All rights reserved.
//

import UIKit
import SnapKit

class ShadowButton: UIButton {
    override var intrinsicContentSize: CGSize { return .zero }
    override var isEnabled: Bool {
        didSet { updateState(self, state) }
    }
    override var isHighlighted: Bool {
        didSet { updateState(self, state) }
    }
    override var isSelected: Bool {
        didSet { updateState(self, state) }
    }
    
    fileprivate var shadowColor: UIColor? {
        get { return layer.shadowColor.flatMap(UIColor.init(cgColor:)) }
        set { layer.shadowColor = newValue?.cgColor }
    }
    override var titleLabel: UILabel? { return textLabel }
    private var textLabel: UILabel? //文言変更に対応するためのLabel
    let contentView: UIView?
    private let updateState: (ShadowButton, UIControlState) -> Void
    
    init(contentView: UIView? = nil,
         cornerRadius: CGFloat? = nil,
         updateState: @escaping (ShadowButton, UIControlState) -> Void = { _, _ in }) {
        self.contentView = contentView
        self.updateState = updateState
        super.init(frame: .zero)
        defer {
            updateState(self, state)
        }
        contentView.map(addSubview)
        contentView?.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.edges.lessThanOrEqualToSuperview()
                .priority(.defaultHigh - 10)  // `contentView` がサイズを保つ場合、そちらを優先する（とりあえず最大 10 の優先度）
        }
        
        contentView?.isUserInteractionEnabled = false
        
        layer.cornerRadius = cornerRadius ?? 4
        layer.shadowOffset.height = 3
        layer.shadowRadius = 1
        layer.shadowOpacity = 0.7
        isExclusiveTouch = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ShadowButton {
    enum Style {
        case `default`
        enum Color {
            case primary
        }
    }
    
    convenience init(contentView: UIView? = nil,
                     cornerRadius: CGFloat? = nil,
                     preferredColor color: Style.Color,
                     updateState: ((ShadowButton, UIControlState) -> Void)?) {
        self.init(contentView: contentView) { button, state in
            if state.contains(.normal) {
                button.backgroundColor = color.backgroundColor
                button.shadowColor = color.shadowColor
                button.alpha = 1
            }
            if state.contains(.selected) || state.contains(.highlighted) {
                button.backgroundColor = color.selectedBackgroundColor
                button.alpha = 1
            }
            if state.contains(.disabled) {
                button.alpha = 0.5
            }
            updateState?(button, state)
        }
    }
    
    // swiftlint:disable:next function_body_length
    convenience init(title: String,
                     leftImage: UIImage? = nil, rightImage: UIImage? = nil,
                     style: Style = .default, color: Style.Color) {
        let parentView: UIView
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = title
        label.textColor = color.textColor
        label.textAlignment = .center
        label.setContentHuggingPriority(.defaultHigh + 1, for: .horizontal)
        
        let hasParent = leftImage != nil || rightImage != nil
        if hasParent {
            parentView = UIView()
            parentView.addSubview(label)
            label.snp.makeConstraints { make in
                make.top.bottom.equalToSuperview()
            }
        } else {
            parentView = label
        }
        
        // 左の画像がある場合の処理
        let leftImageView = leftImage.map(UIImageView.init(image:))
        if let imageView = leftImageView {
            parentView.addSubview(imageView)
            imageView.snp.makeConstraints { make in
                switch style {
                case .default:
                    make.left.centerY.equalToSuperview()
                }
                make.right.equalTo(label.snp.left).offset(-4)
            }
            imageView.setContentHuggingPriority(.defaultHigh + 2, for: .horizontal)
        } else if hasParent {
            // 左の画像がなければ親ビューにくっつく
            label.snp.makeConstraints { make in
                make.left.equalToSuperview()
            }
        }
        
        // 右の画像がある場合の処理
        let rightImageView = rightImage.map(UIImageView.init(image:))
        if let imageView = rightImageView {
            parentView.addSubview(imageView)
            imageView.snp.makeConstraints { make in
                make.left.equalTo(label.snp.right).offset(4)
                make.right.centerY.equalToSuperview()
            }
            imageView.setContentHuggingPriority(.defaultHigh + 3, for: .horizontal)
        } else if hasParent {
            // 右の画像がなければ親ビューにくっつく
            label.snp.makeConstraints { make in
                make.right.equalToSuperview()
            }
        }
        
        self.init(contentView: parentView, preferredColor: color, updateState: nil)
        
        textLabel = label
        
        parentView.snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(44)
        }
    }
}

// MARK: -
private extension ShadowButton.Style.Color {
    var textColor: UIColor {
        switch self {
        case .primary: return .white
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .primary: return .primary
        }
    }
    
    var shadowColor: UIColor {
        switch self {
        case .primary: return .primaryButtonShadow
        }
    }
    
    var selectedBackgroundColor: UIColor {
        switch self {
        case .primary: return .primaryButtonSelected
        }
    }
}

