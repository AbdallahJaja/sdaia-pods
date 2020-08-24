//
//  UIImage+Resize.swift
//  CoronaApp
//
//  Created by عمر سعيد الشمري on 25/03/2020.
//  Copyright © 2020 Ministry of Health. All rights reserved.
//

import UIKit
import CoreImage

public extension UIImage {
    class func resizeImage(imageToResize: UIImage?, targetSize: CGSize) -> UIImage? {
        guard let image = imageToResize else {
            return nil
        }
        
        return UIGraphicsImageRenderer(size:targetSize).image { _ in
            image.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
        
    func imageWithColor(_ color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        color.setFill()
        
        let context = UIGraphicsGetCurrentContext()! as CGContext
        context.translateBy(x: 0, y: self.size.height)
        context.scaleBy(x: 1.0, y: -1.0);
        context.setBlendMode(CGBlendMode.normal)
        
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height) as CGRect
        context.clip(to: rect, mask: self.cgImage!)
        context.fill(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()! as UIImage
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func applyBlurEffect() -> UIImage? {
        
        let context = CIContext(options: nil)
        let imageToBlur = CIImage(image: self)
        let clampFilter = CIFilter(name: "CIAffineClamp")
        clampFilter?.setDefaults()
        clampFilter?.setValue(imageToBlur, forKey: kCIInputImageKey)
        
        //The CIAffineClamp filter is setting your extent as infinite, which then confounds your context. Try saving off the pre-clamp extent CGRect, and then supplying that to the context initializer.
        guard let inputImageExtent = imageToBlur?.extent else { return nil }
        
        guard let currentFilter = CIFilter(name: "CIGaussianBlur") else {
            return nil
        }
        currentFilter.setValue(clampFilter?.outputImage, forKey: kCIInputImageKey)
        currentFilter.setValue(30, forKey: "inputRadius")
        guard let output = currentFilter.outputImage, let cgimg = context.createCGImage(output, from: inputImageExtent) else {
            return nil
        }
        return UIImage(cgImage: cgimg)
        
    }
}
