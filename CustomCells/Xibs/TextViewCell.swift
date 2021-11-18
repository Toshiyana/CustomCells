//
//  TextViewCell.swift
//  CustomCells
//
//  Created by Toshiyana on 2021/11/18.
//

import UIKit

class TextViewCell: UITableViewCell {

    static let identifier = "TextViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "TextViewCell", bundle: nil)
    }
    
    @IBOutlet weak var textViewInCell: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

//        textViewInCell.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}

// CellでDidEndEditingを記述する場合（ViewControllerに値を渡せない）

//extension TextViewCell: UITextViewDelegate {
//    func textViewDidEndEditing(_ textView: UITextView) {
//        print(textViewInCell.text)
//    }
//}
