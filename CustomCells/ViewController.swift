//
//  ViewController.swift
//  CustomCells
//
//  Created by Toshiyana on 2021/11/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        table.register(ImageCell.nib(), forCellReuseIdentifier: ImageCell.identifier)
        table.register(FieldCell.nib(), forCellReuseIdentifier: FieldCell.identifier)
        table.delegate = self
        table.dataSource = self
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // indexPath.rowは大きい順にif文にかける
        
        if indexPath.row > 5 {
            let customCell = tableView.dequeueReusableCell(withIdentifier: ImageCell.identifier, for: indexPath) as! ImageCell
            customCell.configure(with: "Custom cell", imageName: "gear")
            return customCell
        }

        if indexPath.row > 2 {
            let fieldCell = tableView.dequeueReusableCell(withIdentifier: FieldCell.identifier, for: indexPath) as! FieldCell
            return fieldCell
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
        return 70
    }
    
    @objc func didChangedSwitch(_ sender: UISwitch) {
        if sender.isOn {
            print("User turned it on")
        } else {
            print("it's now off")
        }
    }
}
