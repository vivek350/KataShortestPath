//
//  ViewController.swift
//  kataShortestPathLength
//
//  Created by Vivek Vardhan on 2/21/17.
//  Copyright © 2017 Vivek Vardhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let output = ShortestPath()

    var path = ""
    var colCount = 0
    @IBOutlet weak var rowTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var matrixLabel: UILabel!
    @IBOutlet weak var boolLabel: UILabel!
    @IBOutlet weak var pathTotalLabel: UILabel!
    @IBOutlet weak var pathIndexLabel: UILabel!
    @IBOutlet weak var outputButton: UIButton!
    var rows: [[String]] = []
    
    
    @IBAction func clearMatrixClicked(_ sender: Any) {
        
        rows.removeAll()
        errorLabel.text = "Cleared"
        errorLabel.textColor = UIColor.blue
        rowTextField.text = ""
        boolLabel.text = ""
        pathTotalLabel.text = ""
        pathIndexLabel.text = ""
        matrixLabel.text = ""
        
    }
    
    @IBAction func addRowClicked(_ sender: Any) {
        
        errorLabel.text = ""
        if rowTextField.text != "" {
            if output.rowVerification(input: splitString(string: rowTextField.text!)) {
                if(rows.count == 0) {
                    colCount = splitString(string: rowTextField.text!).count
                }
                else {
                    if(splitString(string: rowTextField.text!).count != colCount) {
                        errorLabel.text = "Please enter a valid row"
                        errorLabel.textColor = UIColor.red
                        rowTextField.text = ""
                        return
                    }
                }
                rows.append(splitString(string: rowTextField.text!) as! [String])
                matrixLabel.text = String(describing: rows)
                errorLabel.text = "Row Added"
                errorLabel.textColor = UIColor.blue
                rowTextField.text = ""
                outputButton .isHidden = false

            }else {
                errorLabel.text = "Please enter a valid row"
                errorLabel.textColor = UIColor.red
                rowTextField.text = ""
            }
        }
        else {
            errorLabel.text = "Please enter row to add"
            errorLabel.textColor = UIColor.red
        }
        pathTotalLabel.text = ""
        pathIndexLabel.text = ""
        boolLabel.text = ""
        }
    
    
    func splitString(string: String) -> [Any] {
        let returnString = string.components(separatedBy: ",")
        return returnString
    }
    
    @IBAction func outputClicked(_ sender: Any) {
        let (result,len,path) = output.shortestPath(a: createMatrix())
            
        if rows.count == 0 {
            errorLabel.text = "Please enter a valid row"
            errorLabel.textColor = UIColor.red
        }
        else {
            boolLabel.text = result
            pathIndexLabel.text = path
            pathTotalLabel.text = "\(len)"
        }
    }
    
    func createMatrix()->[[Int]] {
        var test1 = [[Int]]()
        for row in rows {
            let intRow = row.map{ Int($0)}
            test1.append(intRow as! [Int])
        }
        return test1
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

