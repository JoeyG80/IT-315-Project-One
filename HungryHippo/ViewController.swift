//
//  ViewController.swift
//  This App is developed as an education project
//  Certain materials are included under the fair use exemption of the U.S. Copyright law
//  and have been prepared according to the multimedia fair use guidelines and are restricted
//  from further use
//
//  Created by Joseph Greenfield.
//
//

import UIKit
import AVFoundation

class ViewController: UIViewController , UITextFieldDelegate{

   
    
    @IBAction func btnYouTube(_ sender: Any) {
        let app = UIApplication.shared
        let urlAddress = "https://www.youtube.com"
        let urlw = URL(string:urlAddress)
        app.openURL(urlw!)
        
    }
    
    var sound: AVAudioPlayer!
    
    @IBOutlet weak var txtTotal: UITextView!
    
    @IBOutlet weak var calculate: UIButton!
    
    @IBOutlet weak var PerimeterHeight: UITextField!
    @IBOutlet weak var PerimeterWidth: UITextField!
    
    @IBAction func changedAgain(_ sender: UIButton) {
        let YARD = 36
        let SIDES = 2
        let length  = (PerimeterHeight.text! as NSString).integerValue
        let width = (PerimeterWidth.text! as NSString).integerValue
        let perimeter = ((length * SIDES) + (width * SIDES)) / YARD
        txtTotal.text = String(perimeter) + " yard(s)"
        sound.play()
        
    }
    
    @IBOutlet weak var txtTotal2: UITextView!
    @IBOutlet weak var Calculate2: UIButton!
    @IBOutlet weak var PerimeterHeight2: UITextField!
    @IBOutlet weak var PerimeterWidth2: UITextField!
    
    @IBAction func SquareYards(_ sender: UIButton) {
        let length  = (PerimeterHeight.text! as NSString).integerValue
        let width = (PerimeterWidth.text! as NSString).integerValue
        let length2  = (PerimeterHeight2.text! as NSString).integerValue
        let width2 = (PerimeterWidth2.text! as NSString).integerValue
        let area1 = length * width
        let area2 = length2 * width2
        if(!(area1 == 0) && !(area2 == 0)){
            let numSquares = area1 / area2
            if((area1 % area2) > 0){
                txtTotal2.text = "The number of squares does not go evenly"
            }
            else{
                txtTotal2.text = String(numSquares) + " square(s) will"
            }
        }
        sound.play()
        
    }
    
    @IBOutlet weak var imgPizza: UIImageView!
    
    @IBOutlet weak var lblSize: UILabel!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBAction func btnNext(_ sender: Any) {
        setLabel()
    }
    var NameArray = ["Baby", "Crib", "Throw", "Twin", "Double", "Queen", "King"]
    var SizeArray = ["30x40", "36x52", "50x65", "70x90", "85x108", "90x108", "110x108"]
    
    func setLabel() {
        lblSize.alpha = 0
        lblName.alpha = 0
        
        let random = arc4random_uniform(UInt32(NameArray.count))
        let selected = Int(random)
        lblName.text = String(NameArray[selected])
        lblSize.text = String(SizeArray[selected])
        
        UIView.animate(withDuration: 3.0,
                       animations: {
                        self.lblName.alpha = 1
                        self.lblSize.alpha = 1
        })
        sound.play()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sound = try?
            AVAudioPlayer(contentsOf:
                URL(fileURLWithPath:Bundle.main.path(forResource: "sewingMachine", ofType: "wav")!))
        // Do any additional setup after loading the view, typically from a nib.
        
        PerimeterHeight.delegate = self
        PerimeterWidth.delegate = self
       
        setLabel()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        
    }
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        setLabel()
    }
    

}

