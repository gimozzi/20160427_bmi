//
//  ViewController.swift
//  BMI3
//
//  Created by Myoung-Wan Koo on 2016. 3. 30..
//  Copyright © 2016년 Myoung-Wan Koo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    //class 선언 부분에 ,UITextFieldDelegate 추가 되었음
   
    var weight : Double? = 0.0
    var height : Double? = 0.0
    
    var bmi: Double? {  //?: optional - 값이 있어도 되고 없어도 되고
        get {
            //get:
        
            if( weight != nil) && (height != nil){  //값이 있으면 계산
                return weight! / (height! * height!)
            } else {    // 값이 없으면 nil return
                return nil
            }
        }
    }
    
    @IBOutlet weak var bmiLabel: UILabel!
    
    
    @IBOutlet weak var heightTextField: UITextField!
    
    
    @IBOutlet weak var weightTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //keyboard 입력 후 enter 입력하면 toggle software keyboard 사라짐
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    // Update UI: 내부에서 계산한 변수를 화면으로 연결해줌
    // structure 나 class 만 대문자로 시작하게 사용...
    func updateUI() {
        if let b = self.bmi {
            self.bmiLabel.text = String (format: "%4.1f", b )
            
        }
    }
    
    // 입력이 끝났을 때
    func textFieldDidEndEditing(textField: UITextField) {
        
        //작성순서: 4
        //if let 대신 guard 사용
        guard let txt: String = textField.text else {
            return
        }
        print(" 1: ")
        
        //작성순서: 2
        func conv(numString: String) -> Double? {
            let result : Double? = NSNumberFormatter().numberFromString(numString)?.doubleValue
            return result
        }
        
        
        //작성순서: 1
        //if let txt = textField.text{
            switch(textField){
            case heightTextField:
                self.height = conv(txt)
                print(" 2: ")
            case weightTextField:
                self.weight = conv(txt)
                print(" 3: ")
            default:
                print("Something Wrong")
                
            }
       // }
        
        //작성순서: 3
        print(" 4: ")
        updateUI()
    }
    

}

