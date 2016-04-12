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
    
    
    

}

