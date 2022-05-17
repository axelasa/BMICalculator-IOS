//
//  BMIViewController.swift
//  BMI-IOS
//
//  Created by LCT AFRICA on 02/04/2022.
//

import UIKit

class BMIViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var resultView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.heightTextField.delegate = self
        self.weightTextField.delegate = self
        heightTextField.keyboardType = .numberPad
        weightTextField.keyboardType = .numberPad

        // Do any additional setup after loading the view.
    }
    //function to take away the keyboard when you're done typing and touch on any of the text fields.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
        return true
    }
    
    //function to take away the keyboard when you're done typing and touch any part of the mobile screen or UI
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Ensures that the user only inputs numbers in the text field, but does not allow for editing, i.e deleting
    func textField(_ textField:UITextField,shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
        return string.rangeOfCharacter(from: invalidCharacters) == nil
                 }
    
    //actuall function to calculate the BMI
    @IBAction func calculateButtonClicked(_sender:Any){
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
        let height = (heightTextField.text! as NSString).doubleValue
        let weight = (weightTextField.text! as NSString).doubleValue
        //calculating the BMI once button is clicked
        let bmi = (weight / height / height) * 10000
        resultView.text = String(format: "%.2f", bmi)
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
