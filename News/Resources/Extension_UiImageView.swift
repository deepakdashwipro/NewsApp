//
//  Extension_UiImageView.swift
//  News
//
//  Created by Deepak Kumar Dash on 27/08/22.
//

import UIKit
import Foundation

/// declaring global variable for caching images which is downloaded
let imageCache = NSCache<NSString, AnyObject>()

/// UIImageview extension
/// Description - method for adding image download
extension UIImageView {

    /// To downlad image with image url
    ///  - Parameter urlString: Pass Image URL as string which you image you want to down load
    func loadImageUsingCache(withUrl urlString: String) {
        self.image = nil
        self.image = UIImage(systemName: ImageNameConstants.placeholderImg)

        /// checking for image already available in cache
        if let cachedImage = imageCache.object(forKey: urlString as NSString) as? UIImage {
            self.image = cachedImage
            return
        }
        guard let url = URL(string: urlString) else { return }
        let config = URLSessionConfiguration.default
        let delegate = BasicAuthDelegate()
        let session = Foundation.URLSession(configuration: config, delegate: delegate,
                                            delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: url, completionHandler: {requestData, _, errorData -> Void in
            if errorData == nil {
                //  populating Imageview with image data which we had from service or api to Cache on mainthread
                DispatchQueue.main.async() {
                    if let image = UIImage(data: requestData!) {
                        imageCache.setObject(image, forKey: urlString as NSString)
                        self.image = image
                    }
                }
            } else {
                return
            }
        })
        task.resume()
    }
}
