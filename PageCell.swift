//
//  PageCell.swift
//  TeslaApp
//
//  Created by Adnan Ribic on 12/01/2017.
//  Copyright © 2017 Adnan Ribic. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell{
    
    var page: Pages? {
        didSet {
            guard let page = page else {
                return
            }
            let color = UIColor(white: 0.2, alpha: 1)
            imageView.image = UIImage(named: page.imageName)
            let attributedText = NSMutableAttributedString(string: page.title, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 38, weight: UIFontWeightMedium), NSForegroundColorAttributeName: color])
            attributedText.append(NSAttributedString(string: "\n\n\(page.message)", attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 24), NSForegroundColorAttributeName: color]))
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let length = attributedText.string.characters.count
            attributedText.addAttribute(NSParagraphStyleAttributeName,value: paragraphStyle, range: NSRange(location: 0, length: length))
            
            textView.attributedText = attributedText
        }
    }
    
     override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "TeslaImage1")
        iv.clipsToBounds = true
        return iv
    }()
    
    let textView: UITextView = {
        let textV = UITextView()
        textV.text = "Tesla is great car"
        textV.isEditable = false
        textV.contentInset = UIEdgeInsets(top: 34, left: 0, bottom: 0, right: 0)
        return textV
    }()
    
    let lineSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return view
    }()
    
    func setupViews() {
        addSubview(imageView)
        addSubview(textView)
        addSubview(lineSeperatorView)
        imageView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
        textView.anchorWithConstantsToTop(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 0)
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        lineSeperatorView.anchorToTop(top: nil, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
        lineSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
