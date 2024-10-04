//
//  UILabel+Extension.swift
//  Albaid
//
//  Created by 박지윤 on 9/29/24.
//

import UIKit.UILabel

extension UILabel {
    func setLineSpacing(lineSpacing: CGFloat) {
        guard let labelText = self.text else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        
        let attributedString: NSMutableAttributedString
        if let currentAttributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: currentAttributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }
        
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
        
        self.attributedText = attributedString
    }
    
    func setContractTitleLabel(title: String) {
        text = title
        textColor = .albaidGray60
        font = UIFont(name: "Pretendard-Medium", size: 16)
    }
    
    func setContractPlaceHolderLabel(content: String) {
        text = content
        textColor = .albaidGray60
        font = UIFont(name: "Pretendard-SemiBold", size: 16)
    }
    
    func setContractContentLabel(content: String) {
        text = content
        textColor = .albaidGray20
        font = UIFont(name: "Pretendard-SemiBold", size: 16)
    }
    
    func setResumeTitleLabel(title: String) {
        text = title
        textColor = .albaidGray60
        font = UIFont(name: "Pretendard-SemiBold", size: 13)
    }
    
    func setResumeContentLabel(content: String) {
        text = content
        textColor = .albaidGray20
        font = UIFont(name: "Pretendard-Regular", size: 12)
    }
    
    func setResumeDetailContentLabel(content: String) {
        text = content
        textColor = .albaidGray20
        font = UIFont(name: "Pretendard-Medium", size: 15)
    }
    
    func setCheckLabel(title: String) {
        text = title
        textColor = .albaidGray40
        font = UIFont(name: "Pretendard-Medium", size: 16)
    }
    
    func addUnderline() {
        guard let text = self.text else { return }
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributedString.length))
        
        self.attributedText = attributedString
    }
    
    func setUnderline(range: NSRange) {
        guard let attributedString = self.mutableAttributedString() else { return }
        
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
        self.attributedText = attributedString
    }
    
    private func mutableAttributedString() -> NSMutableAttributedString? {
        guard let labelText = self.text, let labelFont = self.font else { return nil }
        
        var attributedString: NSMutableAttributedString?
        if let attributedText = self.attributedText {
            attributedString = attributedText.mutableCopy() as? NSMutableAttributedString
        } else {
            attributedString = NSMutableAttributedString(string: labelText,
                                                         attributes: [NSAttributedString.Key.font :labelFont])
        }
        
        return attributedString
    }
}
