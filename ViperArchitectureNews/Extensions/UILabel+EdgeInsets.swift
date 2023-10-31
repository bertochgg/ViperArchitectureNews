//
//  UILabel+EdgeInsets.swift
//  ViperArchitectureNews
//
//  Created by Cesar Humberto Grifaldo Garcia on 27/09/23.
//

import UIKit

class InsetLabel: UILabel {
    var insets = UIEdgeInsets.zero

    override func drawText(in rect: CGRect) {
        let insetsRect = rect.inset(by: insets)
        super.drawText(in: insetsRect)
    }
}
