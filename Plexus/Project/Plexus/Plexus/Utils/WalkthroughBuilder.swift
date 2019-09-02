//
//  WalkthroughBuilder.swift
//  Plexus
//
//  Created by Anik on 17/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation
import TweenController

protocol TutorialViewController: class {
    var containerView: UIView! { get }
    var buttonsContainerView: UIView! { get }
    var pageControl: UIPageControl! { get }
    func didReachedLastTutorial()
    //var delegate: TutorialProtocol? { get }
}

struct TutorialBuilder {
    
    private static let starsSize = CGSize(width: 326, height: 462)
    private static let baselineScreenWidth: CGFloat = 414
    private static let baselineCardViewHeight: CGFloat = 496
    private static let cardYOffset: CGFloat = 186.0
    private static let cardYTranslation: CGFloat = -28.0
    
    //MARK: Public
    
    static func buildWithContainerViewController(_ viewController: TutorialViewController) -> (TweenController, UIScrollView) {
        let tweenController = TweenController()
        let scrollView = layoutViewsWithVC(viewController)
       // describeBottomControlsWithVC(viewController, tweenController: tweenController, scrollView: scrollView)
        observeEndOfScrollView(viewController, tweenController: tweenController, scrollView: scrollView)
        //describeBackgroundWithVC(viewController, tweenController: tweenController, scrollView: scrollView)
        describeTextWithVC(viewController, tweenController: tweenController, scrollView: scrollView)
        describeReaderWithVC(viewController, tweenController: tweenController, scrollView: scrollView)
        describeCloudWithVC(viewController, tweenController: tweenController, scrollView: scrollView)
        //describeCardImageWithVC(viewController, tweenController: tweenController, scrollView: scrollView)
        //describeCardFacesWithVC(viewController, tweenController: tweenController, scrollView: scrollView)
        //describePinHillWithVC(viewController, tweenController: tweenController, scrollView: scrollView)
       // describeAnimationWithVC(viewController, tweenController: tweenController, scrollView: scrollView)
        
        scrollView.bringSubviewToFront(viewController.buttonsContainerView)
        scrollView.bringSubviewToFront(viewController.pageControl)
        
        return (tweenController, scrollView)
    }
    
    //MARK: Private
    //MARK: Initial Layout
    
    private static func layoutViewsWithVC(_ vc: TutorialViewController) -> UIScrollView {
        let scrollView = UIScrollView(frame: vc.containerView.bounds)
        guard let superview = vc.containerView.superview else { return scrollView }
        
        layoutButtonsAndPageControlWithVC(vc, scrollView: scrollView)
        
        superview.addSubview(scrollView)
        return scrollView
    }
    
    private static func layoutButtonsAndPageControlWithVC(_ vc: TutorialViewController, scrollView: UIScrollView) {
        let snapshot = vc.containerView.snapshotView(afterScreenUpdates: true)
        snapshot?.backgroundColor = UIColor.clear
        
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
        let viewSize = vc.containerView.bounds.size
        scrollView.contentSize = CGSize(width: viewSize.width * 6.0, height: viewSize.height)
        vc.pageControl.numberOfPages = 5
        
        vc.containerView.translatesAutoresizingMaskIntoConstraints = true
        scrollView.addSubview(vc.containerView)
        
        let xOffset = scrollView.contentSize.width - viewSize.width
        snapshot?.frame = vc.containerView.frame.offsetBy(dx: xOffset, dy: 0.0)
        scrollView.addSubview(snapshot!)
        
        /*
        let buttonsFrame = vc.buttonsContainerView.convert(vc.buttonsContainerView.bounds, to: scrollView)
        let pageControlFrame = vc.pageControl.convert(vc.pageControl.bounds, to: scrollView)
        
        vc.buttonsContainerView.translatesAutoresizingMaskIntoConstraints = true
        vc.pageControl.translatesAutoresizingMaskIntoConstraints = true
        scrollView.addSubview(vc.buttonsContainerView)
        scrollView.addSubview(vc.pageControl)
        vc.buttonsContainerView.frame = buttonsFrame
        vc.pageControl.frame = pageControlFrame
 */
    }
    
    //MARK: Tutorial Actions
    
    private static func describeBottomControlsWithVC(_ vc: TutorialViewController, tweenController: TweenController, scrollView: UIScrollView) {
        let viewportSize = vc.containerView.frame.size
        let startingButtonFrame = vc.buttonsContainerView.frame
        let startingPageControlFrame = vc.pageControl.frame
        tweenController.tween(from: startingButtonFrame, at: -1.0)
            .to(startingButtonFrame, at: 0.0)
            .then(to: CGRect(x: startingButtonFrame.minX, y: viewportSize.height, width: startingButtonFrame.width, height: startingButtonFrame.height), at: 1.0)
            .thenHold(until: 4.0)
            .then(to: startingButtonFrame, at: 5.0)
            .with(action: vc.buttonsContainerView.twc_slidingFrameAction(scrollView: scrollView))
        
        let nextPageControlFrame = CGRect(x: startingPageControlFrame.minX, y: startingPageControlFrame.minY + startingButtonFrame.height, width: startingPageControlFrame.width, height: startingPageControlFrame.height)
        tweenController.tween(from: startingPageControlFrame, at: 0.0)
            .to(nextPageControlFrame, at: 1.0)
            .thenHold(until: 4.0)
            .then(to: startingPageControlFrame, at: 5.0)
            .with(action: vc.pageControl.twc_slidingFrameAction(scrollView: scrollView))
    }
    
    private static func describeBackgroundWithVC(_ vc: TutorialViewController, tweenController: TweenController, scrollView: UIScrollView) {
        describeStarGradientWithVC(vc, tweenController: tweenController, scrollView: scrollView)
        //describeStarsWithVC(vc, tweenController: tweenController, scrollView: scrollView)
        describeEiffelTowerWithVC(vc, tweenController: tweenController, scrollView: scrollView)
    }
    
    private static func describeStarGradientWithVC(_ vc: TutorialViewController, tweenController: TweenController, scrollView: UIScrollView) {
        let viewportFrame = CGRect(origin: CGPoint.zero, size: vc.containerView.frame.size)
        let topColor = UIColor(red: 155.0/255.0, green: 39.0/255.0, blue: 153.0/255.0, alpha: 1.0)
        let bottomColor = UIColor(red: 38.0/255.0, green: 198.0/255.0, blue: 218.0/255.0, alpha: 1.0)
        let gradientLayer = CAGradientLayer()
        let gradientView = UIView(frame: viewportFrame.offsetBy(dx: viewportFrame.width, dy: 0.0))
        
        gradientLayer.colors = [bottomColor.cgColor, topColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.frame = viewportFrame
        gradientView.backgroundColor = UIColor.clear
        gradientView.layer.addSublayer(gradientLayer)
        gradientView.alpha = 0.0
        scrollView.insertSubview(gradientView, belowSubview: vc.pageControl)
        
        tweenController.tween(from: viewportFrame, at: 1.0)
            .thenHold(until: 3.0)
            .with(action: gradientView.twc_slidingFrameAction(scrollView: scrollView))
        
        tweenController.tween(from: gradientView.alpha, at: 1.0)
            .to(1.0, at: 2.0)
            .then(to: 0.0, at: 3.0)
            .with(action: gradientView.twc_applyAlpha)
    }
    
    private static func describeCloudWithVC(_ vc: TutorialViewController, tweenController: TweenController, scrollView: UIScrollView) {
        let viewportSize = vc.containerView.frame.size
        let xOffset = (viewportSize.width-starsSize.width)/2.0
        let starsFrame = CGRect(x: xOffset, y: 200.0, width: 38, height: 24)
        let starsImageView = UIImageView(image: UIImage(named: "cloud_medium"))
        
        let cloudFrame = CGRect(x: xOffset + 100, y: 150.0, width: 27, height: 16)
        let cloudImageView = UIImageView(image: UIImage(named: "cloud_small"))
        
        cloudImageView.frame = cloudFrame.offsetBy(dx: viewportSize.width, dy: 0.0)
        cloudImageView.alpha = 1.0
        cloudImageView.contentMode = .scaleToFill
        scrollView.insertSubview(cloudImageView, belowSubview: vc.pageControl)
        
        starsImageView.frame = starsFrame.offsetBy(dx: viewportSize.width, dy: 0.0)
        starsImageView.alpha = 0.0
        starsImageView.contentMode = .scaleToFill
        scrollView.insertSubview(starsImageView, belowSubview: cloudImageView)
        
        let star1 = UIImageView(image: UIImage(named: "star_yellow"))
        let star2 = UIImageView(image: UIImage(named: "stat_white"))
        let star3 = UIImageView(image: UIImage(named: "circle"))
        let star4 = UIImageView(image: UIImage(named: "star_yellow"))
        let star5 = UIImageView(image: UIImage(named: "stat_white"))
        
        let circleFrame = CGRect(x: xOffset, y: 200.0, width: 11, height: 11)
        let star1Frame = CGRect(x: xOffset, y: 200.0, width: 35, height: 35)
        
        star1.frame = star1Frame.offsetBy(dx: 100, dy: 20.0)
        star2.frame = star1Frame.offsetBy(dx: 215, dy: 90.0)
        star3.frame = circleFrame.offsetBy(dx: 35, dy: -38.0)
        star4.frame = star1Frame.offsetBy(dx: 250, dy: -20.0)
        star5.frame = star1Frame.offsetBy(dx: 64, dy: 80.0)
        star1.contentMode = .scaleToFill
        star2.contentMode = .scaleToFill
        star3.contentMode = .scaleToFill
        star4.contentMode = .scaleToFill
        star5.contentMode = .scaleToFill
        scrollView.addSubview(star1)
        scrollView.addSubview(star2)
        scrollView.addSubview(star3)
        scrollView.addSubview(star4)
        scrollView.addSubview(star5)
        
        tweenController.tween(from: starsFrame, at: 1.0)
            .thenHold(until: 4.0)
            .with(action: starsImageView.twc_slidingFrameAction(scrollView: scrollView))
        
        tweenController.tween(from: star1.frame, at: 1.0)
            .thenHold(until: 4.0)
            .with(action: star1.twc_slidingFrameAction(scrollView: scrollView))
        
        /*
        tweenController.tween(from: cloudFrame, at: 1.0)
            .thenHold(until: 4.0)
            .with(action: cloudImageView.twc_slidingFrameAction(scrollView: scrollView))
        */
        tweenController.tween(from: starsImageView.alpha, at: 1.0)
            .to(1.0, at: 2.0)
            .then(to: 0.0, at: 5.0)
            .with(action: starsImageView.twc_applyAlpha)
        
        tweenController.tween(from: star1.alpha, at: 1.0)
            .to(1.0, at: 2.0)
            .then(to: 0.0, at: 5.0)
            .with(action: star1.twc_applyAlpha)
        
        
        let transformA = CGAffineTransform.identity
        let transformB = CGAffineTransform(translationX: 50, y: 0)
        let transformC = CGAffineTransform(translationX: 50, y: 10)
        let transformD = CGAffineTransform(translationX: 50, y: 15)
        tweenController.tween(from: transformA, at: 1.0)
            .to(transformB, at: 2.0)
            .then(to: transformC, at: 3.0)
            .then(to: transformD, at: 4.0)
            .with(action: cloudImageView.layer.twc_applyAffineTransform)
        
        let starTransform = CGAffineTransform.identity
        let star1Transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        let star2Transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        let star3Transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        let star4Transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        
        let starViews = [star1, star2, star3, star4, star5]
        
        for i in 1..<starViews.count {
            let view = starViews[i]
            
            tweenController.tween(from: 0.0, at: 1.0)
                .to(1.0, at: 2.0)
                .then(to: 0.5, at: 5.0)
                .with(action: view.twc_applyAlpha)
            
            tweenController.tween(from: starTransform, at: 0.0)
                .to(star1Transform, at: 1.0)
                //.thenHold(until: 4.0)
                .then(to: star2Transform, at: 2.0)
                .then(to: star3Transform, at: 3.0)
                .then(to: star4Transform, at: 4.0)
                .with(action: view.layer.twc_applyAffineTransform)
        }
        
    }
    
    private static func describeEiffelTowerWithVC(_ vc: TutorialViewController, tweenController: TweenController, scrollView: UIScrollView) {
        let viewportFrame = CGRect(origin: CGPoint.zero, size: vc.containerView.frame.size)
        let imageView = UIImageView(image: UIImage(named: "eiffel_tower"))
        imageView.frame = viewportFrame.offsetBy(dx: viewportFrame.width * 2.0, dy: 0.0)
        imageView.alpha = 0.0
        scrollView.addSubview(imageView)
        
        tweenController.tween(from: viewportFrame, at: 2.0)
            .thenHold(until: 4.0)
            .with(action: imageView.twc_slidingFrameAction(scrollView: scrollView))
        
        tweenController.tween(from: imageView.alpha, at: 2.0)
            .to(1.0, at: 3.0)
            .thenHold(until: 4.0)
            .then(to: 0.0, at: 5.0)
            .with(action: imageView.twc_applyAlpha)
    }
    
    private static func describeReaderWithVC(_ vc: TutorialViewController, tweenController: TweenController, scrollView: UIScrollView) {
        let viewportFrame = CGRect(origin: CGPoint.zero, size: CGSize(width: 275, height: 300))
        let imageView = UIImageView(image: UIImage(named: "user_reading"))
        imageView.frame = viewportFrame.offsetBy(dx: viewportFrame.width * 2.0, dy: 150.0)
        imageView.alpha = 0.0
        scrollView.addSubview(imageView)
        
        tweenController.tween(from: viewportFrame, at: 0.0)
            .thenHold(until: 4.0)
            .with(action: imageView.twc_slidingFrameAction(scrollView: scrollView))
        
        tweenController.tween(from: imageView.alpha, at: 0.0)
            .to(1.0, at: 1.0)
            .thenHold(until: 4.0)
            .then(to: 0.0, at: 5.0)
            .with(action: imageView.twc_applyAlpha)
        
        let rotation: CGFloat = -.pi/60
        let transformA = CGAffineTransform.identity
        let transformB = CGAffineTransform(rotationAngle: rotation)
        let transformC = CGAffineTransform(rotationAngle: rotation  * 2)
        let transformD = CGAffineTransform(rotationAngle: rotation * 4)
        
        
        tweenController.tween(from: transformA, at: 1.0)
            .to(transformB, at: 2.0)
            .then(to: transformC, at: 3.0)
            .then(to: transformD, at: 4.0)
            .with(action: imageView.layer.twc_applyAffineTransform)
    }
    
    private static func describeTextWithVC(_ vc: TutorialViewController, tweenController: TweenController, scrollView: UIScrollView) {
        let viewportFrame = CGRect(origin: CGPoint.zero, size: vc.containerView.frame.size)
        //let multiplier = viewportFrame.width / baselineScreenWidth
        //let topYOffset = 50 * multiplier
        //let bottomYOffset = 80 * multiplier
        
        let topView1 = UILabel()
        topView1.text = "Discover Courses"
        let topView2 = UILabel()
        topView2.text = "Complete Courses"
        let topView3 = UILabel()
        topView3.text = "Give Exam"
        let topView4 = UILabel()
        topView4.text = "Upgrade Your Label"
        
        
        let bottomView1 = UILabel()
        bottomView1.text = "Through our advanced search algorithms, you can find suitable courses easily."
        let bottomView2 = UILabel()
        bottomView2.text = "Through our inteactive learning, you can finish courses easily."
        let bottomView3 = UILabel()
        bottomView3.text = "With uur advance evaluation system, you can take exam."
        let bottomView4 = UILabel()
        bottomView4.text = "And lastly you can overall upgrade your label."
        
        let welcomeView = UILabel()
        welcomeView.text = "Welcome to Plexus"
        welcomeView.font = UIFont(name: "Poppins-SemiBold", size: 24.0)
        welcomeView.textColor = .white
        welcomeView.textAlignment = .center
        let xOff = (viewportFrame.width - vc.containerView.frame.size.width) / 2.0
        welcomeView.frame = CGRect(x: xOff + 24, y: vc.containerView.frame.size.height - 150, width: vc.containerView.frame.size.width - 40, height: 50)
        scrollView.addSubview(welcomeView)
        
        let bottomViews = [bottomView1, bottomView2, bottomView3, bottomView4]
        for i in 0..<bottomViews.count {
            let view = bottomViews[i]
            view.textAlignment = .center
            view.textColor = .white
            view.numberOfLines = 0
            view.font = UIFont(name: "Poppins-Regular", size: 11.0)
            let size = CGSize(width: vc.containerView.frame.size.width, height: 50)
            let xOffset = (viewportFrame.width - size.width) / 2.0
            view.frame = CGRect(x: CGFloat(i + 1) * viewportFrame.width + xOffset + 24, y: vc.containerView.frame.size.height - 50, width: size.width - 40, height: size.height)
            scrollView.addSubview(view)
        }
        
        tweenController.tween(from: bottomView4.alpha, at: 3.0)
            .thenHold(until: 4.0)
            .then(to: 0.0, at: 5.0)
            .with(action: bottomView4.twc_applyAlpha)
        
        let topViews = [topView1, topView2, topView3, topView4]
        for i in 0..<topViews.count {
            let view = topViews[i]
            view.textColor = ColorUtils.hexStringToUIColor(hex: "B3327E")
            view.textAlignment = .center
            view.font = UIFont(name: "Poppins-SemiBold", size: 18.0)
            let size = CGSize(width: vc.containerView.frame.size.width, height: 40)
            let xOffset = (viewportFrame.width - size.width) / 2.0 + viewportFrame.width
            view.frame = CGRect(x: xOffset, y: vc.containerView.frame.size.height - 90, width: size.width, height: size.height)
            scrollView.addSubview(view)
            
            if i != 0 {
                view.alpha = 0.0
                let progress = Double(CGFloat(i) + 0.5)
                tweenController.tween(from: view.alpha, at: progress)
                    .to(1.0, at: progress + 0.5)
                    .then(to: 0.0, at: progress + 1.0)
                    .with(action: view.twc_applyAlpha)
            } else {
                tweenController.tween(from: view.alpha, at: 0.0)
                    .thenHold(until: 1.0)
                    .then(to: 0.0, at: 1.5)
                    .with(action: view.twc_applyAlpha)
            }
            
            tweenController.tween(from: view.frame, at: 0.0)
                .to(view.frame.offsetBy(dx: -viewportFrame.width, dy: 0.0), at: 1.0)
                .thenHold(until: 4.0)
                .with(action: view.twc_slidingFrameAction(scrollView: scrollView))
        }
    }
    
    private static func describeCardTextWithVC(_ vc: TutorialViewController, tweenController: TweenController, scrollView: UIScrollView) {
        let viewportFrame = CGRect(origin: CGPoint.zero, size: vc.containerView.frame.size)
        let multiplier = viewportFrame.width / baselineScreenWidth
        
        // Text Box
        
        let textImage = UIImage(named: "message_bubble")
        let textView1 = UIImageView(image: textImage)
        let textView2 = UIImageView(image: textImage)
        
        scrollView.addSubview(textView1)
        scrollView.addSubview(textView2)
        
        let boxImageSize = CGSize(width: textImage!.size.width * multiplier, height: textImage!.size.height * multiplier)
        let cardImageSize = (UIImage(named: "sunrise")?.size).flatMap() { CGSize(width: $0.width * multiplier, height: $0.height * multiplier) }!
        let xOffset1 = 40.0 * multiplier + viewportFrame.width
        let xOffset2 = (viewportFrame.width - boxImageSize.width) / 2.0 + viewportFrame.width * 2.0
        let yOffset1 = -16.0 * multiplier + cardYOffset * multiplier + cardImageSize.height
        let yOffset2 = -16.0 * multiplier + cardYOffset * multiplier + cardYTranslation * multiplier + cardImageSize.height
        
        let frame1 = CGRect(x: xOffset1, y: yOffset1, width: boxImageSize.width, height: boxImageSize.height)
        let frame2 = CGRect(x: xOffset2, y: yOffset2, width: boxImageSize.width, height: boxImageSize.height)
        textView1.frame = frame1
        textView2.frame = frame2.offsetBy(dx: viewportFrame.width, dy: 0.0)
        
        tweenController.tween(from: frame1, at: 0.0)
            .thenHold(until: 1.0)
            .then(to: frame2, at: 2.0)
            .with(action: textView1.twc_applyFrame)
        
        // Box Contents
        
        let contentsView1 = UIImageView(image: UIImage(named: "card_copy_s2"))
        let contentsView2 = UIImageView(image: UIImage(named: "card_copy_s3"))
        let contentsView3 = UIImageView(image: UIImage(named: "card_copy_s4"))
        
        let contents1Size = CGSize(width: contentsView1.image!.size.width * multiplier, height: contentsView1.image!.size.height * multiplier)
        let contents2Size = CGSize(width: contentsView2.image!.size.width * multiplier, height: contentsView2.image!.size.height * multiplier)
        let contents3Size = CGSize(width: contentsView3.image!.size.width * multiplier, height: contentsView3.image!.size.height * multiplier)
        
        let yMod = -12.0 * multiplier
        contentsView1.frame = CGRect(x: (boxImageSize.width-contents1Size.width)/2.0, y: (boxImageSize.height-contents1Size.height)/2.0 + yMod, width: contents1Size.width, height: contents1Size.height)
        contentsView2.frame = CGRect(x: (boxImageSize.width-contents2Size.width)/2.0, y: (boxImageSize.height-contents2Size.height)/2.0 + yMod, width: contents2Size.width, height: contents2Size.height)
        contentsView3.frame = CGRect(x: (boxImageSize.width-contents3Size.width)/2.0, y: (boxImageSize.height-contents3Size.height)/2.0 + yMod, width: contents3Size.width, height: contents3Size.height)
        
        textView1.addSubview(contentsView1)
        textView1.addSubview(contentsView2)
        textView2.addSubview(contentsView3)
        
        contentsView2.alpha = 0.0
        
        tweenController.tween(from: contentsView1.alpha, at: 0.0)
            .thenHold(until: 1.0)
            .then(to: 0.0, at: 2.0)
            .with(action: contentsView1.twc_applyAlpha)
        
        tweenController.tween(from: contentsView2.alpha, at: 0.0)
            .thenHold(until: 1.0)
            .then(to: 1.0, at: 2.0)
            .with(action: contentsView2.twc_applyAlpha)
    }
    
    private static func describeCardImageWithVC(_ vc: TutorialViewController, tweenController: TweenController, scrollView: UIScrollView) {
        let viewportFrame = CGRect(origin: CGPoint.zero, size: vc.containerView.frame.size)
        let sunriseView = UIImageView(image: UIImage(named: "sunrise"))
        let birthdayView = UIImageView(image: UIImage(named: "birthday_cake"))
        let eiffelView = UIImageView(image: UIImage(named: "eiffel"))
        
        scrollView.addSubview(sunriseView)
        scrollView.addSubview(birthdayView)
        scrollView.addSubview(eiffelView)
        
        let multiplier = viewportFrame.width / baselineScreenWidth
        let imageSize = CGSize(width: sunriseView.image!.size.width * multiplier, height: sunriseView.image!.size.height * multiplier)
        let imageXOffset = (viewportFrame.width - imageSize.width) / 2.0
        let imageYOffset = cardYOffset * multiplier
        
        let frame1 = CGRect(x: viewportFrame.width + imageXOffset, y: imageYOffset, width: imageSize.width, height: imageSize.height)
        let frame2 = frame1.offsetBy(dx: viewportFrame.width, dy: cardYTranslation * multiplier)
        
        sunriseView.frame = frame1
        birthdayView.frame = frame1
        eiffelView.frame = frame2.offsetBy(dx: viewportFrame.width, dy: 0.0)
        
        tweenController.tween(from: frame1, at: 0.0)
            .thenHold(until: 1.0)
            .then(to: frame2, at: 2.0)
            .with(action: sunriseView.twc_applyFrame)
        
        tweenController.tween(from: frame1, at: 1.0)
            .to(frame2, at: 2.0)
            .with(action: birthdayView.twc_applyFrame)
        
        birthdayView.alpha = 0.0
        tweenController.tween(from: sunriseView.alpha, at: 0.0)
            .thenHold(until: 1.0)
            .then(to: 0.0, at: 2.0)
            .with(action: sunriseView.twc_applyAlpha)
        
        tweenController.tween(from: birthdayView.alpha, at: 1.0)
            .to(1.0, at: 2.0)
            .with(action: birthdayView.twc_applyAlpha)
    }
    
    private static func describeCardFacesWithVC(_ vc: TutorialViewController, tweenController: TweenController, scrollView: UIScrollView) {
        let viewportFrame = CGRect(origin: CGPoint.zero, size: vc.containerView.frame.size)
        let multiplier = viewportFrame.width / baselineScreenWidth
        
        let dudeImage = UIImage(named: "dude_face")
        let chickImage = UIImage(named: "chick_face")
        let dudeView1 = UIImageView(image: dudeImage)
        let dudeView2 = UIImageView(image: dudeImage)
        let chickView = UIImageView(image: chickImage)
        
        scrollView.addSubview(dudeView1)
        scrollView.addSubview(dudeView2)
        scrollView.addSubview(chickView)
        chickView.alpha = 0.0
        
        let imageSize = CGSize(width: dudeImage!.size.width * multiplier, height: dudeImage!.size.height * multiplier)
        let xOffset = 250.0 * multiplier
        let yOffset = 380.0 * multiplier
        let frame1 = CGRect(x: xOffset, y: yOffset, width: imageSize.width, height: imageSize.height)
        let frame2 = frame1.offsetBy(dx: 0.0, dy: cardYTranslation * multiplier)
        
        dudeView1.frame = frame1.offsetBy(dx: viewportFrame.width, dy: 0.0)
        chickView.frame = frame1.offsetBy(dx: viewportFrame.width, dy: 0.0)
        dudeView2.frame = frame2.offsetBy(dx: viewportFrame.width * 3.0, dy: 0.0)
        
        tweenController.tween(from: dudeView1.frame, at: 0.0)
            .thenHold(until: 1.0)
            .then(to: frame2.offsetBy(dx: viewportFrame.width * 2.0, dy: 0.0), at: 2.0)
            .with(action: dudeView1.twc_applyFrame)
        
        tweenController.tween(from: chickView.frame, at: 0.0)
            .thenHold(until: 1.0)
            .then(to: frame2.offsetBy(dx: viewportFrame.width * 2.0, dy: 0.0), at: 2.0)
            .with(action: chickView.twc_applyFrame)
        
        tweenController.tween(from: dudeView1.alpha, at: 0.0)
            .thenHold(until: 1.0)
            .then(to: 0.0, at: 2.0)
            .with(action: dudeView1.twc_applyAlpha)
        
        tweenController.tween(from: chickView.alpha, at: 0.0)
            .thenHold(until: 1.0)
            .then(to: 1.0, at: 2.0)
            .with(action: chickView.twc_applyAlpha)
    }
    
    private static func describePinHillWithVC(_ vc: TutorialViewController, tweenController: TweenController, scrollView: UIScrollView) {
        let viewportFrame = CGRect(origin: CGPoint.zero, size: vc.containerView.frame.size)
        let multiplier = viewportFrame.width / baselineScreenWidth
        
        let hillView = UIImageView(image: UIImage(named: "hill"))
        let pinView = UIImageView(image: UIImage(named: "hill_mark"))
        
        scrollView.addSubview(hillView)
        scrollView.addSubview(pinView)
        
        let hillSize = CGSize(width: hillView.image!.size.width * multiplier, height: hillView.image!.size.height * multiplier)
        let pinSize = CGSize(width: pinView.image!.size.width * multiplier, height: pinView.image!.size.height * multiplier)
        
        let pinBottomOffset = 24.0 * multiplier
        let pinXOffset = 28.0 * multiplier
        let yTranslation = pinSize.height + pinBottomOffset
        let hillTopPadding = yTranslation - hillSize.height
        
        let hillXMod = -4.0 * multiplier
        let hillYMod = 4.0 * multiplier
        
        hillView.frame = CGRect(x: hillXMod, y: viewportFrame.maxY + hillTopPadding + hillYMod, width: hillSize.width, height: hillSize.height)
        pinView.frame = CGRect(x: pinXOffset, y: viewportFrame.maxY, width: pinSize.width, height: pinSize.height)
        
        tweenController.tween(from: hillView.frame, at: 0.0)
            .thenHold(until: 1.0)
            .then(to: hillView.frame.offsetBy(dx: 0.0, dy: -yTranslation), at: 2.0)
            .then(to: hillView.frame, at: 3.0)
            .with(action: hillView.twc_slidingFrameAction(scrollView: scrollView))
        
        tweenController.tween(from: pinView.frame, at: 0.0)
            .thenHold(until: 1.0)
            .then(to: pinView.frame.offsetBy(dx: 0.0, dy: -yTranslation), at: 2.0)
            .thenHold(until: 3.0)
            .then(to: pinView.frame.offsetBy(dx: -viewportFrame.width, dy: -yTranslation), at: 4.0)
            .with(action: pinView.twc_slidingFrameAction(scrollView: scrollView))
    }
    
    private static func describeAnimationWithVC(_ vc: TutorialViewController, tweenController: TweenController, scrollView: UIScrollView) {
        let viewportFrame = CGRect(origin: CGPoint.zero, size: vc.containerView.frame.size)
        let multiplier = viewportFrame.width / baselineScreenWidth
        
        let armDownImage = UIImage(named: "chick_arm_down")
        let armUpImage = UIImage(named: "chick_arm_up")
        let chickView = UIImageView(image: armDownImage)
        let cardView = UIImageView(image: UIImage(named: "card_detail"))
        
        scrollView.addSubview(chickView)
        scrollView.addSubview(cardView)
        
        let chickSize = CGSize(width: armDownImage!.size.width * multiplier, height: armDownImage!.size.height * multiplier)
        let cardSize = CGSize(width: cardView.image!.size.width * multiplier, height: cardView.image!.size.height * multiplier)
        
        let chickBottomOffset = 38.0 * multiplier
        let chickXTranslation = -220.0 * multiplier
        let cardXOffset = 82.0 * multiplier + viewportFrame.width * 4.0
        let cardStartingYOffset = 174.0 * multiplier
        let cardYTranslation = 14.0 * multiplier
        
        let cardStartingFrame = CGRect(x: cardXOffset, y: cardStartingYOffset, width: cardSize.width, height: cardSize.height)
        let cardEndingFrame = cardStartingFrame.offsetBy(dx: 0.0, dy: cardYTranslation)
        let chickStartingFrame = CGRect(x: viewportFrame.width * 5.0, y: viewportFrame.maxY - chickBottomOffset - chickSize.height, width: chickSize.width, height: chickSize.height)
        let chickEndingFrame = chickStartingFrame.offsetBy(dx: chickXTranslation, dy: 0.0)
        
        chickView.frame = chickStartingFrame
        cardView.frame = cardStartingFrame
        cardView.alpha = 0.0
        
        tweenController.observeForward(progress: 4.0) { [weak scrollView] _ in
            scrollView?.isScrollEnabled = false
            
            UIView.animate(withDuration: 1.2, animations: { [weak chickView] in
                chickView?.frame = chickEndingFrame
                }, completion: { [weak chickView] finished in
                    chickView?.image = armUpImage
                    UIView.animate(withDuration: 0.5, animations: { [weak cardView] in
                        cardView?.frame = cardEndingFrame
                        cardView?.alpha = 1.0
                        }, completion: { finished in
                            scrollView?.isScrollEnabled = true
                    })
            })
        }
        
        let resetBlock = { [weak chickView, weak cardView] (_: Double) in
            chickView?.image = armDownImage
            chickView?.frame = chickStartingFrame
            cardView?.frame = cardStartingFrame
            chickView?.alpha = 1.0
            cardView?.alpha = 0.0
        }
        
        tweenController.observeBackward(progress: 3.0, block: resetBlock)
        tweenController.observeForward(progress: 5.0, block: resetBlock)
        
        tweenController.tween(from: CGFloat(1.0), at: 4.25)
            .to(0.0, at: 5.0)
            .with(action: cardView.twc_applyAlpha)
        
        tweenController.tween(from: CGFloat(1.0), at: 3.0)
            .thenHold(until: 4.25)
            .then(to: 0.0, at: 5.0)
            .with(action: chickView.twc_applyAlpha)
    }
    
    //MARK: Observers
    
    private static func observeEndOfScrollView(_ vc: TutorialViewController, tweenController: TweenController, scrollView: UIScrollView) {
        tweenController.observeForward(progress: 5.0) { [weak scrollView, weak vc, weak tweenController] _ in
            scrollView?.contentOffset = CGPoint.zero
            scrollView?.isScrollEnabled = false
            scrollView?.isScrollEnabled = true
            tweenController?.resetProgress()
            vc?.pageControl.currentPage = 0
            //go to profile ready view
            vc?.didReachedLastTutorial()
        }
    }
}
