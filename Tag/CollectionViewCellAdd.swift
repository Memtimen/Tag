//
//  CollectionViewCellAdd.swift
//  Tag
//
//  Created by Maimaitiming Abudukadier on 2/8/15.
//  Copyright (c) 2015 Maimaitiming Abudukadier. All rights reserved.
//

import UIKit

var stringTagContent = ""

class CollectionViewCellAdd: UICollectionViewCell, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    override func willMoveToSuperview(newSuperview: UIView?) {
        super.willMoveToSuperview(newSuperview)
        textField.delegate = self
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "checkTextfieldStatus", name: "TagBeenDeleted", object: nil)
    }
    
    //MARK: function
    func checkTextfieldStatus(){
        if arrayTag.count >= 10 {
            textField.resignFirstResponder()
            textField.placeholder = "\(arrayTag.count) is good"
            textField.userInteractionEnabled = false
            animationForTextfield(false)
        }else{
            textField.placeholder = "Add tag"
            textField.userInteractionEnabled = true
        }
    }
    
    
    //MARK: Delegate
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        animationForTextfield(true)
        self.contentView.layer.cornerRadius = 4
        self.contentView.layer.borderColor = UIColor(red: 0/255.0, green: 190/255.0, blue: 130/255.0, alpha: 1).CGColor
        self.contentView.layer.borderWidth = 0.5
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
    }

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var charactersNotAllowed = NSCharacterSet.punctuationCharacterSet()
        if string == string.stringByAddingPercentEncodingWithAllowedCharacters(charactersNotAllowed) {
            if string == "" {
                return true
            }
            if textField.text != "" {
                textFieldShouldReturn(textField)
            }
            return false
        }else{
            return true
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        var str = "\(textField.text)"
        var charactersNotAllowed = NSMutableCharacterSet.punctuationCharacterSet()
        var stringForResualt = ""
        for chr in str {
            if "\(chr)" == "\(chr)".stringByAddingPercentEncodingWithAllowedCharacters(charactersNotAllowed) {
            }else{
                stringForResualt.append(chr)
            }
        }
        
        TagContentMaker().AddTag(stringForResualt)
        textField.text = ""
        checkTextfieldStatus()
        return true
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        self.contentView.layer.cornerRadius = 0
        self.contentView.layer.borderColor = UIColor.clearColor().CGColor
        self.contentView.layer.borderWidth = 0
        return true
    }
    
    
    //MARK: Animation
    func animationForTextfield(shouldBegin: Bool){
        var offSetX:CGFloat
        if shouldBegin {
            offSetX = 10
        }else{
            offSetX = 0
        }
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.textField.frame = CGRectOffset(self.textField.bounds, offSetX, 0)
        }) { (Bool) -> Void in
        }
    }
}
