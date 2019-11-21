//
//  FontChangerViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Liubov Kaper  on 11/20/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class FontChangerViewController: UIViewController {
    
    @IBOutlet weak var fontSlider: UISlider!
    
    @IBOutlet weak var fontStepper: UIStepper!
    
    
    @IBOutlet weak var fontLabel: UILabel!
    
    var stepperFont: Double = 17.0 {
        didSet {
            fontLabel.text = "Preview Font Size: \(Int(fontStepper.value))"
        }
    }
    
    var sliderFont: Double = 17.0 {
        didSet {
            fontLabel.text = "Preview Font Size: \(Int(fontSlider.value))"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
configureSlider()
        configureStepper()
       
    }
    
    func configureSlider() {
        fontSlider.minimumValue = 1.0
        fontSlider.maximumValue = 40.0
        fontSlider.value = 17.0
    }
    
    func configureStepper() {
        fontStepper.minimumValue = 1.0
        fontStepper.maximumValue = 40.0
        fontStepper.value = 17.0
        fontStepper.stepValue = 1.0
    }
    
    @IBAction func fontChangeSlider(_ sender: UISlider) {
        fontStepper.value = Double(sender.value)
        sliderFont = Double(sender.value)
        
        
    }
    
    @IBAction func fontChangeStepper(_ sender: UIStepper) {
        fontSlider.value = Float(sender.value)
        stepperFont = sender.value
    }
    
}
