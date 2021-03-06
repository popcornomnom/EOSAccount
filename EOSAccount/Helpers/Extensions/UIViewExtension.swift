//
//  UIViewExtension.swift
//  EOSAccount
//
//  Created by Marharyta Lytvynenko on 17.11.2019.
//  Copyright (c) 2019 Marharyta Lytvynenko. All rights reserved.
//
//  This file was generated by http://www.popcornomnom.com
//

import  UIKit

//@IBDesignable
extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            clipsToBounds = true
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}
