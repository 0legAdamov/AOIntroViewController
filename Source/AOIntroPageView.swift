//
//  AOIntroPageView.swift
//  AOIntroViewController-Example
//
//  Created by Олег Адамов on 03.03.16.
//  Copyright © 2016 AdamovOleg. All rights reserved.
//

import UIKit


class AOIntroPageView: UIView {
    
    // title
    var title: String?
    var titleTopOffset: CGFloat = 60
    var titleHeight:  CGFloat = 40
    var titleFont: UIFont? = UIFont.systemFontOfSize(22)
    var titleColor = UIColor.blackColor()
    
    //  description
    var desc: String?
    var descBottomOffset: CGFloat = 60
    var descHeight: CGFloat = 60
    var descFont: UIFont? = UIFont.systemFontOfSize(16)
    var descColor = UIColor.blackColor()
    
    //  icon
    var iconImage: UIImage?
    var iconHeight: CGFloat = 260
    var iconYOffsetFromCenter: CGFloat = -10
    
    // private properties
    private var titleLabel: UILabel?
    private var descLabel:  UILabel?
    private var iconImageView: UIImageView?
    
    
    init() {
        super.init(frame: UIScreen.mainScreen().bounds)
        self.backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Private
    
    func setup() {
        self.setupDescription()
        self.setupTitle()
        self.setupIconImage()
    }
    
    private func setupTitle() {
        guard let title = self.title else { return }
        if self.titleLabel == nil {
            let labelFrame = CGRect(x: 0, y: self.titleTopOffset, width: self.frame.width, height: self.titleHeight)
            let label = UILabel(frame: labelFrame)
            label.textAlignment = .Center
            label.numberOfLines = 0
            if let font = self.titleFont { label.font = font }
            label.textColor = self.titleColor
            self.addSubview(label)
            self.titleLabel = label
        }
        self.titleLabel?.text = title
    }
    
    private func setupDescription() {
        guard let desc = self.desc else { return }
        if self.descLabel == nil {
            let labelFrame = CGRect(x: 0, y: self.frame.height - self.descBottomOffset - self.descHeight, width: self.frame.width, height: self.descHeight)
            let label = UILabel(frame: labelFrame)
            label.textAlignment = .Center
            label.numberOfLines = 0
            if let font = self.descFont { label.font = font }
            label.textColor = self.descColor
            self.addSubview(label)
            self.descLabel = label
        }
        self.descLabel?.text = desc
    }
    
    private func setupIconImage() {
        guard let image = self.iconImage else { return }
        if self.iconImageView == nil {
            let iconFrame = CGRect(x: 0, y: round((self.frame.height - self.iconHeight)/2) + self.iconYOffsetFromCenter, width: self.frame.width, height: self.iconHeight)
            let imView = UIImageView(frame: iconFrame)
            imView.contentMode = .ScaleAspectFit
            self.addSubview(imView)
            self.iconImageView = imView
        }
        self.iconImageView?.image = image
    }
}
