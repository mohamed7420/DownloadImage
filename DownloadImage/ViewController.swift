//
//  ViewController.swift
//  DownloadImage
//
//  Created by Mohamed on 9/10/19.
//  Copyright © 2019 Mohamed74. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageDownloaded: UIImageView!
    
    @IBOutlet weak var progressbar: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    @IBAction func btn_download(_ sender: Any) {
        
        let url = URL(string: "https://scontent-hbe1-1.xx.fbcdn.net/v/t1.0-9/69057465_771053816683983_1600980636183560192_n.jpg?_nc_cat=104&_nc_oc=AQl2Jk8DObnoqAo7kpobZoFuQcaoaoSwAFszRWTtIrMZ8QFYL8fdmwPaoKZtZ3StDyc&_nc_ht=scontent-hbe1-1.xx&oh=2fda9174e2ca74aacce22323d69465e3&oe=5DF372FF")
    
        if let url = url {
            
            
            downloadTask(imageLink: url)
            
        }
        
        
        
        
      
        }
        
    
  
    
    fileprivate func progressCheck(shouldSpin status:Bool){
        
        if status == true {
            
            progressbar.isHidden = false
            
            progressbar.startAnimating()
            
        }else{
            
            progressbar.isHidden = true
            progressbar.stopAnimating()
        }
        
    }
    
    private func downloadTask(imageLink url:URL){
        progressCheck(shouldSpin: false)
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                
                print(error)
            }
            
            DispatchQueue.main.async {
             
                if let data = data{
                    
                    self.imageDownloaded.image = UIImage(data: data)
                    self.progressCheck(shouldSpin: false)
                }
                
            }
            
        }.resume()
        
        
    }
    
}

