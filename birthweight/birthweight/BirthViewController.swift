//
//  BirthViewController.swift
//  birthweight
//
//  Created by Bugra Kalayci on 4/5/19.
//  Copyright © 2019 Bugra Kalayci. All rights reserved.
//

import UIKit

class BirthViewController: UIViewController {

    
    @IBOutlet weak var birth: UILabel!
    @IBOutlet weak var current: UILabel!
    @IBOutlet weak var five: UILabel!
    @IBOutlet weak var ten: UILabel!
    var check = 0
    var current_grams=0.0000
    var birth_gram=3000.0
    var fiveG=""
    var fivePD=""
    var fiveP=""
    var tenG=""
    var tenPD=""
    var tenP=""
    var fifteenG=""
    var fifteenPD=""
    var fifteenP=""
    @IBOutlet weak var percent: UILabel!
    @IBOutlet weak var field2: UITextField!
    @IBOutlet weak var field1: UITextField!
    @IBOutlet weak var asd: UISegmentedControl!
    @IBOutlet weak var fifteen: UILabel!
    @IBAction func record(_ sender: UIButton) {
        switch check {
        case 0:
            var s="0"
            s=field1.text ?? "0"
            let current1 = Double(s)
            current_grams = kgToGram(value: current1 ?? Double(0.0))
            current.text=String(s)
            percent.text=String(format:"%.2f",percentLoss())
            f1()
        case 1:
            var s="0"
            s=field1.text ?? "0"
            var r="0"
            r=field2.text ?? "0"
            let current1 = Double(s)
            let current2 = Double(r)
            current.text=s+" p"+r+" o"
            current_grams=poundToGram(value: current1 ?? Double(0.0))
            current_grams=current_grams+OunceToGram(value: current2 ?? Double(0.0))
            percent.text=String(format:"%.2f",percentLoss())
            
            f2()
        case 2:
            var s="0"
            s=field1.text ?? "0"
            let current1 = Double(s)
            current_grams=poundToGram(value: current1 ?? Double(0.0))
            current.text=s
            percent.text=String(format:"%.2f",percentLoss())
            f3()
        default:
            break
        }
    }
    func f1(){
        five.text=String(format:"%.2f",calculate5()/1000)
        ten.text=String(format:"%.2f",calculate10()/1000)
        fifteen.text=String(format:"%.2f",calculate15()/1000)
        fiveG=five.text ?? "-"
        tenG=ten.text ?? "-"
        fifteenG=fifteen.text ?? "-"
    }
    func f2(){
        let fiveLoss=calculate5()
        let tenLoss=calculate10()
        let fifteenLoss=calculate15()
        
        ////////////////////////////////////////////////////
        let pound_decimal=gramsToPound(value: fiveLoss)
        let extract_pound=getPoundFromPound(value: pound_decimal)
        let ounce=poundToOunce(value: pound_decimal)
        let b:String = String(format:"%d", extract_pound)
        let c:String = String(format:"%.2f", ounce)
        
        five.text=b+" p "+c+" o"
        fiveP=five.text ?? "-"
        ////////////////////////////////////////////////////
        let pound_decimal1=gramsToPound(value: tenLoss)
        let extract_pound1=getPoundFromPound(value: pound_decimal1)
        let ounce1=poundToOunce(value: pound_decimal1)
        let b1:String = String(format:"%d", extract_pound1)
        let c1:String = String(format:"%.2f", ounce1)
        ten.text=b1+" p "+c1+" o"
        tenP=ten.text ?? "-"
        ////////////////////////////////////////////////////
        let pound_decimal2=gramsToPound(value: fifteenLoss)
        let extract_pound2=getPoundFromPound(value: pound_decimal2)
        let ounce2=poundToOunce(value: pound_decimal2)
        let b2:String = String(format:"%d", extract_pound2)
        let c2:String = String(format:"%.2f", ounce2)
        fifteen.text=b2+" p "+c2+" o"
        fifteenP=fifteen.text ?? "-"
    }
    func f3(){
        let fiveLoss=calculate5()
        let tenLoss=calculate10()
        let fifteenLoss=calculate15()
        
        let loss5=gramsToPound(value: fiveLoss)
        let loss10=gramsToPound(value: tenLoss)
        let loss15=gramsToPound(value: fifteenLoss)
        five.text=String(format:"%.2f",loss5)
        ten.text=String(format:"%.2f",loss10)
        fifteen.text=String(format:"%.2f",loss15)
        fivePD=five.text ?? "-"
        tenPD=ten.text ?? "-"
        fifteenPD=fifteen.text ?? "-"
        
    }
    @IBAction func indexChanged(_ sender: Any) {
        switch asd.selectedSegmentIndex{
        case 0:
            check=0
            let val = gramTokg(value: birth_gram)
            let b:String = String(format:"%.2f", val)
            birth.text=b
            field2.isHidden=true
            let cur = gramTokg(value: current_grams)
            current.text=String(format:"%.2f", cur)
            five.text=fiveG
            ten.text=tenG
            fifteen.text=fifteenG
            f1()
//            percent.text=String(format:"%.2f",percentLoss())
            
        case 1:
            check=1
            let pound_decimal=gramsToPound(value: birth_gram)
            let extract_pound=getPoundFromPound(value: pound_decimal)
            let ounce=poundToOunce(value: pound_decimal)
            let b:String = String(format:"%d", extract_pound)
            let c:String = String(format:"%.2f", ounce)
            birth.text=b+" p "+c+" o"
            field2.isHidden=false
            /////////////////////////////
            print(current_grams)
            let pound1=gramsToPound(value: current_grams)
            let pounsInt=getPoundFromPound(value: pound1)
            let ounce1=poundToOunce(value: pound1)
            let v:String = String(format:"%d", pounsInt)
            let z:String = String(format:"%.2f", ounce1)
            current.text=v+" p "+z+" o"
            five.text=fiveP
            ten.text=tenP
            fifteen.text=fifteenP
            f2()
        case 2:
            check=2
            
            let pound_decimal=gramsToPound(value: birth_gram)
            let b:String = String(format:"%.2f", pound_decimal)
            birth.text=b
            
            
            field2.isHidden=true
            ////////////////////
            let pound_decimal1=gramsToPound(value: current_grams)
            let q:String = String(format:"%.2f", pound_decimal1)
            current.text=q
//            current.text="here3"
//            percent.text=String(format:"%.2f",percentLoss())
            five.text=fivePD
            ten.text=tenPD
            fifteen.text=fifteenPD
            f3()
        default:
            break
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        UserDefaults.standard.set("Integer",forKey: )
        
        if check==0{
            let val = gramTokg(value: birth_gram)
            let b:String = String(format:"%.2f", val)
            birth.text=b
            field2.isHidden=true
            
        }
        
        // Do any additional setup after loading the view.
    }
    func percentLoss()->Double{
        var loss=birth_gram-current_grams
        loss = loss/birth_gram
        return loss*100
    }
    func gramsToPound(value: Double) -> Double{
        var new_value = value
        new_value = new_value/453.592
        return new_value
    }
    func poundToGram(value: Double) -> Double{
        var new_value = value
        new_value = new_value*453.592
        return new_value
    }
    func poundToOunce(value:Double)->Double{
        var temp = value
        while(temp>1){
            temp=temp-1
        }
        temp = temp * 16
        
        return temp
    }
    func OunceToGram(value:Double)->Double{
        var val = value
        val = val * 28.3495
        return val
    }
    func gramToOunce(value:Double)->Double{
        var val = value
        val = val / 28.3495
        return val
    }
    
    func getPoundFromPound(value:Double)->Int{
        let val=value
        return Int(val)
    }
    func gramTokg(value:Double)->Double{
        var val=value
        val = val/1000
        return val
        
    }
    func kgToGram(value:Double)->Double{
        var val=value
        val = val*1000
        return val
        
    }
    func calculate5()->Double{
        let a = birth_gram*0.05
        return a
    }
    func calculate10()->Double{
        let a = birth_gram*0.1
        return a
    }
    func calculate15()->Double{
        let a = birth_gram*0.15
        return a
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
