//
//  ViewController.swift
//  dynamic_collectionview
//
//  Created by shin seunghyun on 2020/04/21.
//  Copyright © 2020 shin seunghyun. All rights reserved.
//

import UIKit
//Access to Photo
import Photos

class ViewController: UICollectionViewController {

    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        grabPhotos()
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    func grabPhotos() {
        
        let imgManager: PHImageManager = PHImageManager.default()
        
        let requestOptions: PHImageRequestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = true
        //이미지 품질
        requestOptions.deliveryMode = .highQualityFormat
        
        let fetchOptions: PHFetchOptions = PHFetchOptions()
        //Sort
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        //실질적으로 이미지를 가져옴
        let fetchResult: PHFetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
        if fetchResult.count > 0 {
        
            for i in 0..<fetchResult.count {
                imgManager.requestImage(
                    for: fetchResult.object(at: i),
                    targetSize: CGSize(width: 200, height: 200) ,
                    contentMode: .aspectFill,
                    options: requestOptions) { (image, error) in
                        self.imageArray.append(image!)
                }
            }
            
            collectionView.reloadData()
            
        } else {
            print("You got no photos!")
            collectionView.reloadData()
        }
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let imageView: UIImageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = imageArray[indexPath.row]
        return cell
    }


}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.frame.width / 3 - 1
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        1.0
    }
    
}
