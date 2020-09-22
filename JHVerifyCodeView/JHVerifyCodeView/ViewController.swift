//
//  ViewController.swift
//  JHVerifyCodeView
//
//  Created by HaoCold on 2020/9/14.
//  Copyright © 2020 HaoCold. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //
        self.navigationItem.title = "验证码输入框"
        
        //
        self.example1()
        
        //
        self.example2()
        
        //
        self.example3()
        
        //
        self.example4()
        
        //
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem.init(title: "清空", style: UIBarButtonItem.Style.plain, target: self, action: #selector(clearAction)),
            UIBarButtonItem.init(title: "跳转", style: UIBarButtonItem.Style.plain, target: self, action: #selector(jumpAction))
        ]
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
        config.useSystemPasswordKeyboard = true
        
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
    
    func example2() {
        //
        let label: UILabel = UILabel()
        label.frame = CGRect(x: 0, y: 210, width: self.view.frame.width, height: 30)
        label.text = "InputType: Number"
        label.textAlignment = .center
        self.view.addSubview(label)
        
        //
        let resultLabel: UILabel = UILabel()
        resultLabel.frame = CGRect(x: 0, y: 270, width: self.view.frame.width, height: 30)
        resultLabel.textAlignment = .center
        self.view.addSubview(resultLabel)
        
        //
        var config = JHVCConfig()
        config.inputBoxNumber = 6
        config.inputBoxSpacing = 5
        config.inputBoxWidth = 33
        config.inputBoxHeight = 28
        config.tintColor = UIColor.green
        config.secureTextEntry = false
        config.inputBoxColor = UIColor.brown
        config.font = UIFont.boldSystemFont(ofSize: 16)
        config.textColor = UIColor.cyan
        config.inputType = JHVCConfigInputType.number
        config.inputBoxBorderWidth = 1
        config.inputBoxHighlightedColor = UIColor.purple
        
        config.customInputHolder = "🈲"
        
        config.inputBoxFinishColors = [UIColor.orange, UIColor.red]
        config.finishFonts = [UIFont.boldSystemFont(ofSize: 20), UIFont.systemFont(ofSize: 20)]
        config.finishTextColors = [UIColor.orange, UIColor.green]
        
        let codeView = JHVerifyCodeView.init(frame: CGRect(x: 0, y: 240, width: self.view.bounds.size.width, height: 30),
                                             config: config)
        codeView.inputBlock = { (text: String) -> () in
            print(text)
        }
        codeView.finishBlock = { (view: JHVerifyCodeView, code: String) -> () in
            let index: Int = code.elementsEqual("123456") ? 1 : 0
            view.showInputFinishColorWithIndex(index)
            
            resultLabel.text = code
        }
        codeView.tag = 200
        self.view.addSubview(codeView)
    }
    
    func example3() {
        //
        let label: UILabel = UILabel()
        label.frame = CGRect(x: 0, y: 300, width: self.view.frame.width, height: 30)
        label.text = "InputType: Alphabet"
        label.textAlignment = .center
        self.view.addSubview(label)
        
        //
        let resultLabel: UILabel = UILabel()
        resultLabel.frame = CGRect(x: 0, y: 360, width: self.view.frame.width, height: 30)
        resultLabel.textAlignment = .center
        self.view.addSubview(resultLabel)
        
        //
        var config = JHVCConfig()
        config.inputBoxNumber = 6
        config.inputBoxSpacing = -1
        config.inputBoxWidth = 33
        config.inputBoxHeight = 28
        config.tintColor = UIColor.red
        config.secureTextEntry = false
        config.inputBoxColor = UIColor.brown
        config.font = UIFont.boldSystemFont(ofSize: 16)
        config.textColor = UIColor.gray
        config.inputType = JHVCConfigInputType.alphabet
        config.inputBoxBorderWidth = 1
        
        config.customInputHolder = "❄️"
        
        let codeView = JHVerifyCodeView.init(frame: CGRect(x: 0, y: 330, width: self.view.bounds.size.width, height: 30),
                                             config: config)
        codeView.inputBlock = { (text: String) -> () in
            print(text)
        }
        codeView.finishBlock = { (view: JHVerifyCodeView, code: String) -> () in
            resultLabel.text = code
        }
        codeView.tag = 300
        self.view.addSubview(codeView)
    }
    
    func example4() {
        //
        let label: UILabel = UILabel()
        label.frame = CGRect(x: 0, y: 390, width: self.view.frame.width, height: 30)
        label.text = "InputType: Alphabet"
        label.textAlignment = .center
        self.view.addSubview(label)
        
        //
        let resultLabel: UILabel = UILabel()
        resultLabel.frame = CGRect(x: 0, y: 450, width: self.view.frame.width, height: 30)
        resultLabel.textAlignment = .center
        self.view.addSubview(resultLabel)
        
        //
        var config = JHVCConfig()
        config.inputBoxNumber = 4
        config.inputBoxSpacing = 4
        config.inputBoxWidth = 33
        config.inputBoxHeight = 28
        config.tintColor = UIColor.blue
        config.secureTextEntry = true
        config.inputBoxColor = UIColor.clear
        config.font = UIFont.boldSystemFont(ofSize: 20)
        config.textColor = UIColor.gray
        config.inputType = JHVCConfigInputType.alphabet
        
        config.inputBoxBorderWidth = 1
        config.showUnderLine = true
        config.underLineSize = CGSize(width: 33, height: 2)
        config.underLineColor = UIColor.brown
        config.underLineHighlightedColor = UIColor.red
        
        config.underLineFinishColors = [UIColor.blue, UIColor.orange]
        config.finishFonts = [UIFont.boldSystemFont(ofSize: 20), UIFont.systemFont(ofSize: 20)]
        config.finishTextColors = [UIColor.green, UIColor.orange]
        
        let codeView = JHVerifyCodeView.init(frame: CGRect(x: 0, y: 420, width: self.view.bounds.size.width, height: 30),
                                             config: config)
        codeView.inputBlock = { (text: String) -> () in
            print(text)
        }
        codeView.finishBlock = { (view: JHVerifyCodeView, code: String) -> () in
            let index: Int = code.elementsEqual("Qazd") ? 1 : 0
            view.showInputFinishColorWithIndex(index)
            
            resultLabel.text = code
        }
        codeView.tag = 400
        self.view.addSubview(codeView)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func clearAction() {
        let view1: JHVerifyCodeView? = self.view.viewWithTag(100) as? JHVerifyCodeView
        let view2: JHVerifyCodeView? = self.view.viewWithTag(200) as? JHVerifyCodeView
        let view3: JHVerifyCodeView? = self.view.viewWithTag(300) as? JHVerifyCodeView
        let view4: JHVerifyCodeView? = self.view.viewWithTag(400) as? JHVerifyCodeView
        
        view1?.clear()
        view2?.clear()
        view3?.clear()
        view4?.clear()
    }
    
    @objc func jumpAction() {
        self.navigationController?.pushViewController(NextViewController(), animated: true)
    }
}

