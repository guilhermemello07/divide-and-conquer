//
//  ResultViewController.swift
//  Divide-and-Conquer-iOS16
//
//  Created by Guilherme Mello on 07/04/23.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var valuePerPersonLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    
    var calculatedResult: String?
    var numberOfPeople: Float?
    var tipPercentage: String?
    var totalAmount: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        valuePerPersonLabel.text = "$\(calculatedResult!)"
        splitLabel.text = "The total value of $\(String(describing: totalAmount!)) split between \(String(format: "%.0f", numberOfPeople!)) people, with a \(String(describing: tipPercentage!)) tip."
        
    }
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
