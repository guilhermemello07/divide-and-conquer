//
//  ViewController.swift
//  Divide-and-Conquer-iOS16
//
//  Created by Guilherme Mello on 07/04/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var splitStepperLabel: UIStepper!
    @IBOutlet weak var totalBillTextField: UITextField!
    
    @IBOutlet weak var twentyPercentageButton: UIButton!
    @IBOutlet weak var tenPercentageButton: UIButton!
    @IBOutlet weak var zeroPercentageButton: UIButton!
    
    var peopleToShare: Float?
    var percentageTipString: String?
    var percentageTip: Float?
    var totalAmountDue: String?
    var amountPerPerson: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //delegating the textLabel to be able to dismiss the keyboard on Return
        totalBillTextField.delegate = self
        peopleToShare = Float(splitStepperLabel.value)
    }

    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        amountPerPerson = (Float(totalAmountDue!)! * (1+percentageTip!)) / Float(peopleToShare!)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    @IBAction func splitStepperChanged(_ sender: UIStepper) {
        splitLabel.text = String(format: "%.0f" ,sender.value)
        peopleToShare = Float(sender.value)
    }
    
    @IBAction func tipButtonSelected(_ sender: UIButton) {
        totalBillTextField.endEditing(true)
        twentyPercentageButton.isSelected = false
        tenPercentageButton.isSelected = false
        zeroPercentageButton.isSelected = false
        sender.isSelected = true
        
        if twentyPercentageButton.isSelected {
            percentageTip = 0.2
        } else if tenPercentageButton.isSelected {
            percentageTip = 0.1
        } else {
            percentageTip = 0.0
        }
        percentageTipString = (sender.titleLabel?.text ?? "no value")
    }
    
    @IBAction func totalBillEntered(_ sender: UITextField) {
        totalAmountDue = sender.text ?? "no text"
    }
    
    //Hiding the keyboard on pressing RETURN
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destination = segue.destination as! ResultViewController
            destination.calculatedResult = String(format: "%.2f", amountPerPerson!)
            destination.numberOfPeople = peopleToShare
            destination.tipPercentage = percentageTipString
            destination.totalAmount = totalAmountDue
        }
    }

}

