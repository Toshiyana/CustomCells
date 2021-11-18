//
//  FieldCell.swift
//  CustomCells
//
//  Created by Toshiyana on 2021/11/18.
//

import UIKit

class FieldCell: UITableViewCell, UITextFieldDelegate {

    static let identifier = "FieldCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "FieldCell", bundle: nil)
    }
    
    @IBOutlet weak var field: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        field.delegate = self
        field.placeholder = "Enter something..."
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("\(textField.text ?? "")")
        return true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
