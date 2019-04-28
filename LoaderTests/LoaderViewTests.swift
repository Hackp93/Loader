//
//  LoaderViewTests.swift
//  LoaderTests
//
//  Created by Manu Singh on 28/04/19.
//  Copyright © 2019 Manu Singh. All rights reserved.
//

import UIKit
import XCTest
@testable import Loader

class LoaderViewTests: XCTestCase {

    func testLoaderViewXibClassSet(){
        let loaderView = getLoaderView()
        XCTAssertNotNil(loaderView)
        
    }
    
    func testLoaderViewOutletsSet(){
        let loaderView = getLoaderView()
        XCTAssertNotNil(loaderView?.loaderImage)
        XCTAssertNotNil(loaderView?.textLabel)
    }
    
    func testLoaderViewFrame(){
        let rootController = UIViewController()
        _ = getWindow(withRoot: rootController)
        rootController.showLoader(with: "loading")
        let loaderView = rootController.view.subviews.first as? LoaderView
        XCTAssertEqual(loaderView?.textLabel.text, "loading")
        
        let expectatio = expectation(description: "loader view frame is not correct")
        
        let queue = DispatchQueue(label: "me.hackp93.Loader")
        let delay: DispatchTimeInterval = .seconds((1))
        queue.asyncAfter(deadline: .now() + delay) {
            DispatchQueue.main.sync(){
                XCTAssertEqual(rootController.view.bounds, loaderView?.frame)
                XCTAssert((loaderView?.loaderImage.isAnimating)!)
                expectatio.fulfill()
            }
        }
        
        wait(for: [expectatio], timeout: 2)
        
    }
    
}

func getLoaderView()->LoaderView? {
    let nib  = UINib(nibName: "Loader", bundle: nil)
    let loaderView = nib.instantiate(withOwner: nil, options: nil).first as? LoaderView
    return loaderView
}

func getWindow(withRoot controller : UIViewController)->UIWindow{
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = controller
    window.makeKeyAndVisible()
    return window
}
