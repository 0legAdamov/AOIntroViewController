//
//  AOIntroViewController.swift
//  AOIntoViewController-Example
//
//  Created by Олег Адамов on 02.03.16.
//  Copyright © 2016 AdamovOleg. All rights reserved.
//

import UIKit


enum AOIntroControllerStyle {
    case Dark, Light
}


protocol AOIntroViewControllerDelegate: class {
    func introViewControllerDidDismiss()
}


private enum AOIntroInitializationType {
    case Blurred(AOIntroControllerStyle)
    case Imaged(UIImage?)
    case Colored(UIColor)
    case BlurredImage(AOIntroControllerStyle, UIImage?)
}


class AOIntroViewController: UIViewController, UIScrollViewDelegate {
    
    init(withBlurStyle style: AOIntroControllerStyle) {
        self.initializationType = .Blurred(style)
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .OverCurrentContext
    }
    
    init(withBackgroundImage image: UIImage?) {
        self.initializationType = .Imaged(image)
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .OverCurrentContext
    }
    
    init(withBackgroundColor color: UIColor) {
        self.initializationType = .Colored(color)
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .OverCurrentContext
    }
    
    init(withBlurStyle style: AOIntroControllerStyle, andImage image: UIImage?) {
        self.initializationType = .BlurredImage(style, image)
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .OverCurrentContext
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var pageViews = [AOIntroPageView]()
    var canTapToNext = true
    weak var delegate: AOIntroViewControllerDelegate?
    
    private let initializationType: AOIntroInitializationType
    private var containerView = UIScrollView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.alpha = 0
        
        //  add transparent view
        self.pageViews.append(AOIntroPageView())
        
        self.configureContainer()
        
        for pageView in pageViews {
            self.configurePage(pageView)
        }
    }
    
    
    func showAnimated() {
        if self.pageViews.count < 2 {
            print("Intro: nothing to show")
            self.close()
            return
        }
        
        UIView.animateWithDuration(0.3, delay: 0, options: .CurveEaseInOut, animations: {
            self.view.alpha = 1
            }, completion: nil)
    }

    
    // MARK: - Private
    
    func close() {
        self.dismissViewControllerAnimated(false, completion: nil)
        self.delegate?.introViewControllerDidDismiss()
    }
    
    private func configureContainer() {
        switch initializationType {
        case let .Blurred(style):
            let blurEffect = UIBlurEffect(style: style == .Dark ? .Dark : .Light)
            let blurView = UIVisualEffectView(effect: blurEffect)
            blurView.frame = self.view.bounds
            self.view.addSubview(blurView)
        case let .Imaged(image):
            let backImView = UIImageView(image: image)
            backImView.contentMode = .ScaleAspectFill
            backImView.frame = self.view.bounds
            self.view.addSubview(backImView)
        case let .BlurredImage(style, image):
            let backImView = UIImageView(image: image)
            backImView.contentMode = .ScaleAspectFill
            backImView.frame = self.view.bounds
            self.view.addSubview(backImView)
            let blurEffect = UIBlurEffect(style: style == .Dark ? .Dark : .Light)
            let blurView = UIVisualEffectView(effect: blurEffect)
            blurView.frame = self.view.bounds
            self.view.addSubview(blurView)
        case let .Colored(color):
            self.view.backgroundColor = color
        }
        
        self.containerView = UIScrollView(frame: self.view.bounds)
        self.containerView.bounces = false
        self.containerView.pagingEnabled = true
        self.containerView.showsHorizontalScrollIndicator = false
        self.containerView.showsVerticalScrollIndicator = false
        self.containerView.contentSize = CGSize(width: 0, height: UIScreen.mainScreen().bounds.height)
        self.containerView.delegate = self
        self.view.addSubview(self.containerView)
        
        if canTapToNext {
            let tapGesture = UITapGestureRecognizer(target: self, action: "handleTap:")
            self.containerView.addGestureRecognizer(tapGesture)
        }
    }
    
    
    func handleTap(gesture: UITapGestureRecognizer) {
        let criticalOffset = UIScreen.mainScreen().bounds.width * CGFloat(self.pageViews.count - 1)
        var nextOffset = self.containerView.contentOffset
        nextOffset.x += UIScreen.mainScreen().bounds.width
        if nextOffset.x >= criticalOffset {
            self.containerView.setContentOffset(nextOffset, animated: true)
            UIView.animateWithDuration(0.4, delay: 0, options: .CurveEaseInOut, animations: {
                self.view.alpha = 0.0
                self.containerView.contentOffset = nextOffset
                }, completion: { [weak self] _ in
                    self?.close()
            })
        } else {
            UIView.animateWithDuration(0.4, delay: 0, options: .CurveEaseInOut, animations: {
                self.containerView.contentOffset = nextOffset
                }, completion: { _ in
            })
        }
    }
    
    
    private func configurePage(pageView: AOIntroPageView) {
        var pageFrame = pageView.frame
        var contentSize = self.containerView.contentSize
        pageFrame.origin.x = contentSize.width
        pageView.frame = pageFrame
        pageView.setup()
        contentSize.width += pageFrame.width
        self.containerView.contentSize = contentSize
        self.containerView.addSubview(pageView)
    }
    
    
    // MARK: scroll view delegate
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let screenWidth = UIScreen.mainScreen().bounds.width
        let beginOffset = screenWidth * CGFloat(self.pageViews.count - 2)
        if scrollView.contentOffset.x >= beginOffset {
            let persents = (scrollView.contentOffset.x - beginOffset)/screenWidth
            self.view.alpha = 1 - persents
            
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let criticalOffset = UIScreen.mainScreen().bounds.width * CGFloat(self.pageViews.count - 1)
        if scrollView.contentOffset.x >= criticalOffset {
            self.close()
        }
    }
    
}



