//
//  Loader.swift
//  Loader
//
//  Created by Manu Singh on 09/04/19.
//  Copyright © 2019 Manu Singh. All rights reserved.
//

import Foundation
import UIKit

class LoaderView : UIView {
    
    @IBOutlet weak var textLabel : UILabel!
    @IBOutlet weak var loaderImage : UIImageView!
    
    func startAnimating(_ text : String){
        textLabel.text = text
        loaderImage.animationImages = getAnimatedImages()
        loaderImage.animationDuration = 1
        loaderImage.startAnimating()
    }
    
    func getAnimatedImages()->[UIImage]{
        var images = [UIImage]()
        
        for i in 0 ..< 30 {
            images.append(UIImage(named: "loader\(i)")!)
        }
        return images
    }
    
    func addLoaderConstraints(){
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: self.superview!, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: self.superview!, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: self.superview!, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: self.superview!, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
    }
    
}

extension UIViewController {
    
    func showLoader(with text : String){
        guard getLoaderView() == nil else {
            return
        }
        let loaderNib = UINib(nibName: "Loader", bundle: nil)
        let loaderView = loaderNib.instantiate(withOwner: nil, options: nil).first as! LoaderView
        view.addSubview(loaderView)
        loaderView.addLoaderConstraints()
        loaderView.startAnimating(text)
    }
    
    func hideLoader(){
        getLoaderView()?.removeFromSuperview()
    }
    
    func getLoaderView()->LoaderView?{
        
        for anyView in view.subviews {
            if let loaderView = anyView as? LoaderView {
                return loaderView
            }
        }
        return nil
        
    }
    
    
}
