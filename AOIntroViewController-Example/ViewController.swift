//
//  ViewController.swift
//  AOIntoViewController-Example
//
//  Created by Олег Адамов on 04.03.16.
//  Copyright © 2016 AdamovOleg. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, AOIntroViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Examples"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.min
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            self.showWithLightBlur()
        case 1:
            self.showWithDarkBlur()
        case 2:
            self.showWithColoredBackground()
        case 3:
            self.showWithBackgroundImage()
        case 4:
            self.showWithBlurredImage()
        default:
            break
        }
    }
    
    
    func showWithLightBlur() {
        let page1 = AOIntroPageView()
        page1.title = "Page 1 Title"
        page1.desc = "description text of page 1\nis placed here"
        page1.descColor = UIColor.darkGrayColor()
        page1.iconImage = UIImage(named: "im_example_1.png")
        
        let page2 = AOIntroPageView()
        page2.title = "Page 2 Title"
        page2.desc = "description text of page 2\nis placed here"
        page2.descColor = UIColor.darkGrayColor()
        page2.iconImage = UIImage(named: "im_example_2.png")
        
        let intro = AOIntroViewController(withBlurStyle: .Light)
        intro.delegate = self
        intro.pageViews = [page1, page2]
        self.navigationController?.presentViewController(intro, animated: false) {
            intro.showAnimated()
        }
    }
    
    
    func showWithDarkBlur() {
        let page1 = AOIntroPageView()
        page1.title = "Page 1 Title"
        page1.titleColor = UIColor.whiteColor()
        page1.desc = "description text of page 1\nis placed here"
        page1.descColor = UIColor.lightGrayColor()
        page1.iconImage = UIImage(named: "im_example_1.png")
        
        let page2 = AOIntroPageView()
        page2.title = "Page 2 Title"
        page2.titleColor = UIColor.whiteColor()
        page2.desc = "description text of page 2\nis placed here"
        page2.descColor = UIColor.lightGrayColor()
        page2.iconImage = UIImage(named: "im_example_2.png")
        
        let intro = AOIntroViewController(withBlurStyle: .Dark)
        intro.delegate = self
        intro.pageViews = [page1, page2]
        self.navigationController?.presentViewController(intro, animated: false) {
            intro.showAnimated()
        }
    }
    
    
    func showWithColoredBackground() {
        let page1 = AOIntroPageView()
        page1.title = "Page 1 Title"
        page1.desc = "description text of page 1\nis placed here"
        page1.descColor = UIColor.lightGrayColor()
        page1.iconImage = UIImage(named: "im_example_1.png")
        
        let page2 = AOIntroPageView()
        page2.title = "Page 2 Title"
        page2.desc = "description text of page 2\nis placed here"
        page2.descColor = UIColor.lightGrayColor()
        page2.iconImage = UIImage(named: "im_example_2.png")
        
        let intro = AOIntroViewController(withBackgroundColor: UIColor.whiteColor())
        intro.delegate = self
        intro.pageViews = [page1, page2]
        self.navigationController?.presentViewController(intro, animated: false) {
            intro.showAnimated()
        }
    }
    
    
    func showWithBackgroundImage() {
        let page1 = AOIntroPageView()
        page1.title = "Page 1 Title"
        page1.desc = "description text of page 1\nis placed here"
        page1.descColor = UIColor.lightGrayColor()
        
        let page2 = AOIntroPageView()
        page2.title = "Page 2 Title"
        page2.desc = "description text of page 2\nis placed here"
        page2.descColor = UIColor.lightGrayColor()
        
        let intro = AOIntroViewController(withBackgroundImage: UIImage(named: "back_image_example.jpg"))
        intro.delegate = self
        intro.pageViews = [page1, page2]
        self.navigationController?.presentViewController(intro, animated: false) {
            intro.showAnimated()
        }
    }
    
    
    func showWithBlurredImage() {
        let page1 = AOIntroPageView()
        page1.title = "Page 1 Title"
        page1.titleColor = UIColor.whiteColor()
        page1.desc = "description text of page 1\nis placed here"
        page1.descColor = UIColor.lightGrayColor()
        page1.iconImage = UIImage(named: "im_example_1.png")
        
        let page2 = AOIntroPageView()
        page2.title = "Page 2 Title"
        page2.titleColor = UIColor.whiteColor()
        page2.desc = "description text of page 2\nis placed here"
        page2.descColor = UIColor.lightGrayColor()
        page2.iconImage = UIImage(named: "im_example_2.png")
        
        let intro = AOIntroViewController(withBlurStyle: .Dark, andImage: UIImage(named: "blurred_image_example.jpg"))
        intro.delegate = self
        intro.pageViews = [page1, page2]
        self.navigationController?.presentViewController(intro, animated: false) {
            intro.showAnimated()
        }
    }
    
    func introViewControllerDidDismiss() {
        print("Intro Controller Did Dismiss")
    }
}

