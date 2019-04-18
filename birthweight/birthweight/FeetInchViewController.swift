//
//  FeetInchViewController.swift
//  birthweight
//
//  Created by Bugra Kalayci on 4/7/19.
//  Copyright © 2019 Bugra Kalayci. All rights reserved.
//

import UIKit

class FeetInchViewController: UIViewController {
    @IBOutlet weak var feet: UITextField!

    
    
    @IBOutlet weak var centimeters: UITextField!
    @IBOutlet weak var inch: UITextField!
    
    @IBAction func Clear(_ sender: Any) {
//        let d: String! = "ASFD"
//        centimeters?.text="ASzfdsf"
//        print (centimeters.text ?? d)
    }
    @IBAction func Calculate(_ sender: Any) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        feet.text="2"
//        inch.text="3"
        // Do any additional setup after loading the view.
    }
    func cmToInch(value:Double)->Double{
        let inch=value/2.54
        return inch
    }
    func cmToFeet(value:Double)->Double{
        let feet=value/30.48
        return feet
    }
    func feetToCm(value:Double)->Double{
        let feet=value*30.48
        return feet
    }
    func inchToCm(value:Double)->Double{
        let inch=value*2.54
        return inch
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
