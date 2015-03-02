//
//  StreamFooterButton.swift
//  Ello
//
//  Created by Sean Dougherty on 12/10/14.
//  Copyright (c) 2014 Ello. All rights reserved.
//

import UIKit

class StreamFooterButton: UIButton {

    var attributedText:NSMutableAttributedString = NSMutableAttributedString(string: "")

    func setButtonTitleWithPadding(title: String?, titlePadding: CGFloat = 4.0, contentPadding: CGFloat = 5.0) {

        if let title = title {
            setButtonTitle(title, color: UIColor.greyA(), forState: .Normal)
            setButtonTitle(title, color: UIColor.blackColor(), forState: .Highlighted)
            setButtonTitle(title, color: UIColor.blackColor(), forState: .Selected)
        }

        let titleInsets = UIEdgeInsetsMake(0.0, titlePadding, 0.0, -(titlePadding));

        var contentInsets = UIEdgeInsetsMake(0.0, contentPadding, 0.0, contentPadding)

        titleEdgeInsets = titleInsets
        contentEdgeInsets = contentInsets
        sizeToFit()
    }

    private func setButtonTitle(title:String, color:UIColor, forState state:UIControlState) {
        attributedText = NSMutableAttributedString(string: title)
        var range = NSRange(location: 0, length: countElements(title))
        contentHorizontalAlignment = .Left
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.Left

        var attributes = [
            NSFontAttributeName : UIFont.typewriterFont(12.0),
            NSForegroundColorAttributeName : color,
            NSParagraphStyleAttributeName : paragraphStyle
        ]

        attributedText.addAttributes(attributes, range: range)
        self.titleLabel?.textAlignment = .Left
        self.setAttributedTitle(attributedText, forState: state)
    }

    override func sizeThatFits(size: CGSize) -> CGSize {
        let size = super.sizeThatFits(size)
        return CGSizeMake(size.width, 44.0)
    }

}