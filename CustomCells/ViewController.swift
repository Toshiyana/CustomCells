//
//  ViewController.swift
//  CustomCells
//
//  Created by Toshiyana on 2021/11/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    var timeOption: TimeOption = .countDown
    enum TimeOption {
        case countDown
        case dateTime
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        table.register(ImageCell.nib(), forCellReuseIdentifier: ImageCell.identifier)
        table.register(FieldCell.nib(), forCellReuseIdentifier: FieldCell.identifier)
        table.register(TextViewCell.nib(), forCellReuseIdentifier: TextViewCell.identifier)
        table.register(DatePickerCell.nib(), forCellReuseIdentifier: DatePickerCell.identifier)
        table.delegate = self
        table.dataSource = self
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if timeOption == .countDown {
            return 5 // リピートするを表示（処理が複雑になるので不採用。リピートが存在するかしないかもチェックする必要があるため。）
        }
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 4 && timeOption == .countDown {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = "リピートする"
            
            // add switch in cell
            let mySwitch = UISwitch()
            mySwitch.isOn = true
            mySwitch.addTarget(self, action: #selector(didChangedSwitch(_:)), for: .valueChanged)
            cell.accessoryView = mySwitch
            
            return cell
        }
        
        // indexPath.rowは大きい順にif文にかける
        if indexPath.row == 3 {
            let datePickerCell = tableView.dequeueReusableCell(withIdentifier: DatePickerCell.identifier, for: indexPath) as! DatePickerCell
            datePickerCell.timeOptionSegmentedControl.addTarget(self, action: #selector(didChangedDateSegment(_:)), for: .valueChanged)
            datePickerCell.datePicker.addTarget(self, action: #selector(didChangedDatePicker(_:)), for: .valueChanged)
            return datePickerCell
        }
             
        if indexPath.row == 2 {
            let customCell = tableView.dequeueReusableCell(withIdentifier: ImageCell.identifier, for: indexPath) as! ImageCell
            customCell.configure(with: "Custom cell", imageName: "gear")
            return customCell
        }

        if indexPath.row == 1 {
            let fieldCell = tableView.dequeueReusableCell(withIdentifier: FieldCell.identifier, for: indexPath) as! FieldCell
            
            // addTargetでTableView上で、Cellの要素にアクセス可能（.editingDidEnd: textFieldでreturnを押した時に処理を行う）
            fieldCell.field.addTarget(self, action: #selector(didChangedField(_:)), for: .editingDidEnd)
            
            return fieldCell
        }
        
        if indexPath.row == 0 {
            let textViewCell = tableView.dequeueReusableCell(withIdentifier: TextViewCell.identifier, for: indexPath) as! TextViewCell
            textViewCell.textViewInCell.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(_:)))
            
            textViewCell.textViewInCell.delegate = self // cellのtextViewの値をViewControllerで取得するために、delegateを利用
            
            return textViewCell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Hello world"

        // add switch in cell
        let mySwitch = UISwitch()
        mySwitch.isOn = true
        mySwitch.addTarget(self, action: #selector(didChangedSwitch(_:)), for: .valueChanged)
        cell.accessoryView = mySwitch

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    @objc func didChangedSwitch(_ sender: UISwitch) {
        if sender.isOn {
            print("User turned it on")
        } else {
            print("it's now off")
        }
    }
    
    @objc func didChangedField(_ sender: UITextField) {
        print(sender.text ?? "")
    }

    @objc func tapDone(_ sender: Any) {
        view.endEditing(true)
    }
    
    @objc func didChangedDateSegment(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            timeOption = .countDown
        } else {
            timeOption = .dateTime
        }
        table.reloadData()
        
        print(sender.selectedSegmentIndex)
    }
    
    @objc func didChangedDatePicker(_ sender: UIDatePicker) {
        print(sender.date)
    }
}

// ViewControllerでCell内のTextViewのDidEndEditingを記述する場合（ViewControllerで値の取得が可能）
extension ViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        print(textView.text ?? "")
    }
}
