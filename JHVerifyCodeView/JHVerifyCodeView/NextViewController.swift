//
//  NextViewController.swift
//  JHVerifyCodeView
//
//  Created by HaoCold on 2020/9/22.
//  Copyright © 2020 HaoCold. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        self.example1()
    }
    
    func example1() {
        
        //
        let label: UILabel = UILabel()
        label.frame = CGRect(x: 0, y: 120, width: self.view.frame.width, height: 30)
        label.text = "InputType: Number & Alphabet"
        label.textAlignment = .center
        self.view.addSubview(label)
        
        //
        let resultLabel: UILabel = UILabel()
        resultLabel.frame = CGRect(x: 0, y: 180, width: self.view.frame.width, height: 30)
        resultLabel.textAlignment = .center
        self.view.addSubview(resultLabel)
        
        //
        var config = JHVCConfig()
        config.inputBoxNumber = 6
        config.inputBoxSpacing = 5
        config.inputBoxWidth = 33
        config.inputBoxHeight = 28
        config.tintColor = UIColor.black
        config.secureTextEntry = false
        config.inputBoxColor = UIColor.brown
        config.font = UIFont.boldSystemFont(ofSize: 16)
        config.textColor = UIColor.blue
        config.inputType = JHVCConfigInputType.number_alphabet
        config.inputBoxBorderWidth = 1
        config.inputBoxCornerRadius = 5
        config.keyboardType = UIKeyboardType.numbersAndPunctuation
        
        config.autoShowKeyboard = true
        config.autoShowKeyboardDelay = 0.7
        
        config.inputBoxFinishColors = [UIColor.red, UIColor.orange]
        config.finishFonts = [UIFont.boldSystemFont(ofSize: 20), UIFont.systemFont(ofSize: 20)]
        config.finishTextColors = [UIColor.green, UIColor.orange]
        
        let codeView = JHVerifyCodeView.init(frame: CGRect(x: 0, y: 150, width: self.view.bounds.size.width, height: 30),
                                             config: config)
        codeView.inputBlock = { (text: String) -> () in
            print(text)
        }
        codeView.finishBlock = { (view: JHVerifyCodeView, code: String) -> () in
            let index: Int = code.elementsEqual("123321") ? 1 : 0
            view.showInputFinishColorWithIndex(index)
            
            resultLabel.text = code
        }
        codeView.tag = 100
        self.view.addSubview(codeView)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
