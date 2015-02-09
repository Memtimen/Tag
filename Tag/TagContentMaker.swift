//
//  TagContentMaker.swift
//  Tag
//
//  Created by Maimaitiming Abudukadier on 2/8/15.
//  Copyright (c) 2015 Maimaitiming Abudukadier. All rights reserved.
//

import UIKit

var arrayTag = NSMutableArray()

class TagContentMaker: NSObject {
   
    func AddTag(tag:NSString){
        arrayTag.addObject(tag)
        NSNotificationCenter.defaultCenter().postNotificationName("added", object: nil)
    }
}
