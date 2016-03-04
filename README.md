# AOIntroViewController
[![Language](http://img.shields.io/badge/language-swift-brightgreen.svg?style=flat)]
(https://developer.apple.com/swift)
[![CocoaPods compatible](http://img.shields.io/cocoapods/v/AOIntroViewController.svg?style=flat)]
(https://cocoapods.org/pods/AOIntroViewController)
[![CocoaPods available](http://img.shields.io/badge/available-iOS%208-orange.svg)]
(https://developer.apple.com/swift)

Simple view controller for presenting tutorial screens

## Installation
CocoaPods: 
`pod 'AOIntroViewController'`

##Usage

####Creating IntroPage

You can create some intro pages by `let page = AOIntroPageView()` and set properties:

**Title**

- `title`
- `titleTopOffset`
- `titleHeight`
- `titleFont`
- `titleColor`

**Description**

- `desc`
- `descBottomOffset`
- `descHeight`
- `descFont`
- `descColor`

**Image**

- `iconImage`
- `iconHeight`
- `iconYOffsetFromCenter`

For example:

```
let page = AOIntroPageView()
page.title = "Page 1 Title"
page.titleTopOffset = 60
page.desc = "description text of page 1\nis placed here"
page.descColor = UIColor.whiteColor()
page.iconImage = UIImage(named: "test_image.png")
```

####Creating intro controller

For creating intro controller you can use one of the initialization methods:

- `let intro = AOIntroViewController(withBlurStyle: .Light)`
- `let intro = AOIntroViewController(withBlurStyle: .Dark)`
- `let intro = AOIntroViewController(withBackgroundColor: UIColor.whiteColor())`
- `let intro = AOIntroViewController(withBackgroundImage: UIImage(named: "image.jpg"))`
- `let intro = AOIntroViewController(withBlurStyle: .Dark, andImage: UIImage(named: "image.jpg"))`

Set pages for controller: `intro.pageViews = [page1, page2]`

Set property `intro.canTapToNext = true` (default - true)

Set `AOIntroViewControllerDelegate` if needed: `intro.delegate = self` then add
```
func introViewControllerDidDismiss() {
        print("Intro Controller Did Dismiss")
    }
```
After that you can show intro controller, for example:
```
self.navigationController?.presentViewController(intro, animated: false) {
    intro.showAnimated()
}
```
