//
//  DatePickerCell.swift
//  CustomCells
//
//  Created by Toshiyana on 2021/11/18.
//

import UIKit

class DatePickerCell: UITableViewCell {

    static let identifier = "DatePickerCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "DatePickerCell", bundle: nil)
    }
    
    @IBOutlet weak var timeOptionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        datePicker.preferredDatePickerStyle = .wheels
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func timeOptionSegmentedChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            datePicker.datePickerMode = .countDownTimer
        }
        else {
            datePicker.datePickerMode = .dateAndTime
        }
    }
    
}
