//
//  ViewController.swift
//  LimitCharactersSwift
//
//  Created by Darren Leak on 2020/04/12.
//  Copyright © 2020 ProgrammingWithSwift. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var textfield: UITextField! {
        didSet {
            textfield.delegate = self
        }
    }
    
    @IBOutlet weak var textview: UITextView! {
        didSet {
            textview.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        return self.textLimit(existingText: textField.text,
                              newText: string,
                              limit: 10)
    }
    
    func textView(_ textView: UITextView,
                  shouldChangeTextIn range: NSRange,
                  replacementText text: String) -> Bool {
        return self.textLimit(existingText: textView.text,
                              newText: text,
                              limit: 10)
    }
        
    private func textLimit(existingText: String?,
                           newText: String,
                           limit: Int) -> Bool {
        let text = existingText ?? ""
        let isAtLimit = text.count + newText.count <= limit
        return isAtLimit
    }

}
