//
//  CollectionViewController.swift
//  Tag
//
//  Created by Maimaitiming Abudukadier on 2/8/15.
//  Copyright (c) 2015 Maimaitiming Abudukadier. All rights reserved.
//

import UIKit


class CollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "insert", name: "added", object: nil)
    }
    
    func insert(){
        self.collectionView!.insertItemsAtIndexPaths([NSIndexPath(forRow: arrayTag.count-1, inSection: 0)])
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1 + arrayTag.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let add = collectionView.dequeueReusableCellWithReuseIdentifier("add", forIndexPath: indexPath) as CollectionViewCellAdd
        let tag = collectionView.dequeueReusableCellWithReuseIdentifier("tag", forIndexPath: indexPath) as CollectionViewCellTag
        if indexPath.row == arrayTag.count {
            return add
        }else{
            tag.labelTag.text = arrayTag[indexPath.row] as NSString
            return tag
        }
    }
    
    //MARK: CellHeight
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        
        if arrayTag.count > 0 && indexPath.row != arrayTag.count {
           var string = arrayTag[indexPath.row] as NSString
            var lable = UILabel()
            lable.text = string
            lable.font = UIFont.systemFontOfSize(17)
            lable.sizeToFit()
            if lable.frame.size.width > CGRectGetWidth(self.view.frame) - 60 {
                return CGSizeMake (CGRectGetWidth(self.view.frame) , 30)
            }else{
            var size = CGSizeMake(CGRectGetWidth(lable.frame) + 50, 30)
                return size}
        }else {
            var String = ""
            return CGSizeMake(140, 30)
        }
    }


    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }



    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if arrayTag.count > 0 && indexPath.row != arrayTag.count {
            var cell = collectionView.cellForItemAtIndexPath(indexPath) as CollectionViewCellTag
            arrayTag.removeObjectAtIndex(indexPath.row)
            self.collectionView!.deleteItemsAtIndexPaths([indexPath])
            NSNotificationCenter.defaultCenter().postNotificationName("TagBeenDeleted", object: nil)
        }else{
            
        }
        
    }


    


}
