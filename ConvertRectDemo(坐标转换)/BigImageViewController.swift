//
//  BigImageViewController.swift
//  ConvertRectDemo(坐标转换)
//
//  Created by Erickson on 16/3/24.
//  Copyright © 2016年 paiyipai. All rights reserved.
//

import UIKit

let kScreenWidth = UIScreen.mainScreen().bounds.size.width
let kScreenHeight = UIScreen.mainScreen().bounds.size.height

class BigImageViewController: UIViewController {

    
    
    var img:UIImage?//可能是 先从路径read，没有则从网络加载，加载后存入doc目录
    var parentView : UIView?
    
    var originalRect = CGRectZero
    var currentRect =  CGRectZero
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(touchImg))
        self.view.addGestureRecognizer(tap)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        showPhotoBrowser()
    }
    
    func show() {
        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(self, animated: false, completion: nil)

    }
    

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        
    }
    func touchImg() {
        let winImageView = UIImageView()
        winImageView.frame = currentRect
        winImageView.image = img
        winImageView.contentMode = .ScaleAspectFit
        self.view.window?.addSubview(winImageView)
        self.dismissViewControllerAnimated(false, completion: nil)
    
        UIView.animateWithDuration(0.25, animations: {
            winImageView.frame = self.originalRect
        }) { (finished) in
            winImageView.removeFromSuperview()
        }
    }
    
    func showPhotoBrowser() {
        let sub = parentView?.subviews[0]
        originalRect = self.view.convertRect(sub!.frame, fromView: self.view)
        let imgView = UIImageView()
        imgView.frame = originalRect
        imgView.image = img
        self.view.addSubview(imgView)
        imgView.contentMode = .ScaleAspectFit;
        
        let rectH = imgView.image?.size.height

        if rectH < kScreenHeight {
            currentRect = CGRectMake(0, (kScreenHeight - rectH!)*0.5, kScreenWidth, rectH!)
        } else {
            currentRect = CGRectMake(0, 0, kScreenWidth, rectH!)
            
        }
        
        UIView.animateWithDuration(0.3) {
            imgView.frame = self.currentRect
        }
        
    }
    
    
}
