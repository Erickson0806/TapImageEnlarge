//
//  ViewController.swift
//  ConvertRectDemo(坐标转换)
//
//  Created by Erickson on 16/3/24.
//  Copyright © 2016年 paiyipai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ges = UITapGestureRecognizer(target: self, action: #selector(scaleToBig))
        imgView.addGestureRecognizer(ges)
        print(imgView.frame)

    }
    
    
    
    func scaleToBig() {
        let bigImgVc = BigImageViewController()
        bigImgVc.img = imgView.image
        bigImgVc.parentView = self.view
        bigImgVc.show()
        
    }
    
  /*
     例把UITableViewCell中的subview(btn)的frame转换到 controllerA中
     
     // controllerA 中有一个UITableView, UITableView里有多行UITableVieCell，cell上放有一个button
     // 在controllerA中实现:
     CGRect rc = [cell convertRect:cell.btn.frame toView:self.view];
     或
     CGRect rc = [self.view convertRect:cell.btn.frame fromView:cell];
     // 此rc为btn在controllerA中的rect
     
     或当已知btn时：
     CGRect rc = [btn.superview convertRect:btn.frame toView:self.view];
     或
     CGRect rc = [self.view convertRect:btn.frame fromView:btn.superview];
     
     */
    

}

