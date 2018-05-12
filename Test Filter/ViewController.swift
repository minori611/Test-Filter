//
//  ViewController.swift
//  Test Filter
//
//  Created by Minori on 2018/05/12.
//  Copyright © 2018年 那須美律. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var buttonA: UIButton!
    private var imageView: UIImageView!
    var originalImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let iWidth: CGFloat = 300
        let iHeight: CGFloat = 400
        let posX: CGFloat = (self.view.bounds.width - iWidth)/2
        let posY: CGFloat = (self.view.bounds.height - iHeight)/2
        imageView = UIImageView(frame: CGRect(x: posX, y: posY, width: iWidth, height: iHeight))
        originalImage = UIImage(named: "IMG_4857.JPG")!
        imageView.image = originalImage
        self.view.addSubview(imageView)
        
        buttonA = UIButton()
        let bWidth: CGFloat = 200
        let bHeight: CGFloat = 50
        let buttonPosX: CGFloat = self.view.frame.width/2 - bWidth/2
        let buttonPosY: CGFloat = self.view.frame.height/6 - bHeight/6
        buttonA.frame = CGRect(x: buttonPosX, y: buttonPosY, width: bWidth, height: bHeight)
        buttonA.setTitleColor(UIColor.blue, for: .normal)
        buttonA.addTarget(self, action: #selector(ViewController.sepiaFilter(sender:)), for: .touchUpInside)
        self.view.addSubview(buttonA)
        
        
    }
    

    @objc func sepiaFilter(sender: UIButton){
        let sepiaFilter = CIFilter(name: "CISepiaTone")!
        sepiaFilter.setValue(originalImage, forKey: kCIInputImageKey)
        sepiaFilter.setValue(1.0, forKey: kCIInputIntensityKey)
        
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(sepiaFilter.outputImage!, from: sepiaFilter.outputImage!.extent)
        imageView.image = UIImage(cgImage: cgImage!)
            
        /*// フィルターを通した画像をアウトプット.
        let myOutpuImage : CIImage = sepiaFilter!.outputImage!
            
        // 再びUIViewにセット.
        myImageView.image = UIImage(ciImage: myOutputImage)
            
        // 再描画.
        myImageView.setNeedsDisplay()*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

