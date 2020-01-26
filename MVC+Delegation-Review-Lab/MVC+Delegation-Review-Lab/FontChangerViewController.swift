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
    
   // STEP 2
     weak var delegate: FontDelegate?
    
    //    var stepperFont: Double = 17.0 {
    //        didSet {
    //            fontLabel.text = "Preview Font Size: \(Int(fontStepper.value))"
    //        }
    // }
    
    var sliderFont: CGFloat? {
        didSet {
       updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSlider()
        configureStepper()
        updateUI()
    }
    
    func updateUI() {
        guard let validFontSize = sliderFont else {
            fatalError("...")
        }
        fontSlider?.value = Float(validFontSize)
        fontStepper?.value = Double(validFontSize)
        fontLabel?.text = "Preview Font Size: \(Int(fontSlider.value))"
        fontSlider?.value = Float(validFontSize)
        fontStepper?.value = Double(validFontSize)
        // STEP 3
        delegate?.didChangeFont(self)
    }
    
    func configureSlider() {
        fontSlider.minimumValue = 1.0
        fontSlider.maximumValue = 40.0
      // delegate?.didChangeFont(self)
    }
    
    func configureStepper() {
        fontStepper.minimumValue = 1.0
        fontStepper.maximumValue = 40.0
        fontStepper.stepValue = 1.0
       // delegate?.didChangeFont(self)
    }
    
    @IBAction func fontChangeSlider(_ sender: UISlider) {
        fontStepper.value = Double(sender.value)
        sliderFont = CGFloat(sender.value)
       // delegate?.didChangeFont(self)
        
    }
    
    @IBAction func fontChangeStepper(_ sender: UIStepper) {
        fontSlider.value = Float(sender.value)
        sliderFont = CGFloat(sender.value)
    }
    
    
    @IBAction func returnButton(_ sender: UIButton) {
        
    }
    
}
