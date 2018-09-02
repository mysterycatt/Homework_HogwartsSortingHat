//
//  ViewController.swift
//  trueLoveHogwarts
//
//  Created by Pei Wu on 02/09/2018.
//  Copyright © 2018 Pei Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var magicalSwitch: UISwitch!
    @IBOutlet weak var petSegControl: UISegmentedControl!
    @IBOutlet weak var courageSlider: UISlider!
    @IBOutlet weak var cunningSlider: UISlider!
    @IBOutlet weak var magicalLabel: UILabel!
    @IBOutlet weak var courageLabel: UILabel!
    @IBOutlet weak var cunningLabel: UILabel!
    
    @IBOutlet weak var muggleLabel: UILabel!
    @IBOutlet weak var huffLabel: UILabel!
    @IBOutlet weak var slyLabel: UILabel!
    @IBOutlet weak var ravLabel: UILabel!
    @IBOutlet weak var gryLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // 打開magical的開關後，旁邊會顯示出設定好的Label
    @IBAction func magicalSwitchOn(_ sender: UISwitch) {
        if magicalSwitch.isOn == true {
            magicalLabel.isHidden = false
        }
    }
    
    // CourageSlider的數值改變時，旁邊的Label會顯示不同的字樣。分成了三個區間(0~0.3, 0.3~0.65, 0.65~1)
    @IBAction func changeCourage(_ sender: UISlider) {
        if sender.value < 0.3 {
            courageLabel.text = "Little.."
        } else if sender.value < 0.65 {
            courageLabel.text = "Average"
        } else {
            courageLabel.text = "Strong!"
        }
    }
    
    // CunningSlider的數值改變時，旁邊的Label會顯示不同的字樣。分成了三個區間(0~0.3, 0.3~0.65, 0.65~1)
    @IBAction func changeCunning(_ sender: UISlider) {
        if sender.value < 0.3 {
            cunningLabel.text = "Kind"
        } else if sender.value < 0.65 {
            cunningLabel.text = "Average"
        } else {
            cunningLabel.text = "Evil!"
        }
    }
    

    
    @IBAction func sort(_ sender: Any) {
        
        // 用簡單的單詞去定義出這些條件，避免寫if else時畫面太亂
        let wizard = magicalSwitch.isOn == true
        let catChoose = petSegControl.selectedSegmentIndex == 0
        let dogChoose = petSegControl.selectedSegmentIndex == 1
        let slyTraits = cunningLabel.text == "Evil!"
        let gryTraits = courageLabel.text == "Strong!"
        
        if magicalSwitch.isOn == false { 
            slyLabel.isHidden = true
            ravLabel.isHidden = true
            gryLabel.isHidden = true
            huffLabel.isHidden = true
            muggleLabel.isHidden = false
        } else if wizard, catChoose, slyTraits {
            slyLabel.isHidden = false
            ravLabel.isHidden = true
            gryLabel.isHidden = true
            huffLabel.isHidden = true
            muggleLabel.isHidden = true
        } else if wizard, catChoose {
            slyLabel.isHidden = true
            ravLabel.isHidden = false
            gryLabel.isHidden = true
            huffLabel.isHidden = true
            muggleLabel.isHidden = true
        } else if wizard, dogChoose, slyTraits {
            slyLabel.isHidden = false
            ravLabel.isHidden = true
            gryLabel.isHidden = true
            huffLabel.isHidden = true
            muggleLabel.isHidden = true
        } else if wizard, dogChoose, gryTraits  {
            slyLabel.isHidden = true
            ravLabel.isHidden = true
            gryLabel.isHidden = false
            huffLabel.isHidden = true
            muggleLabel.isHidden = true
        } else if wizard, dogChoose {
            slyLabel.isHidden = true
            ravLabel.isHidden = true
            gryLabel.isHidden = true
            huffLabel.isHidden = false
            muggleLabel.isHidden = true
        }
    
    }
    
    
    

}

