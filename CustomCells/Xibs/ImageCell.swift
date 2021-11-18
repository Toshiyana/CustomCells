//
//  ImageCell.swift
//  CustomCells
//
//  Created by Toshiyana on 2021/11/18.
//

import UIKit

class ImageCell: UITableViewCell {

    static let identifier = "ImageCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ImageCell", bundle: nil)
    }
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    public func configure(with title: String, imageName: String) {
        myLabel.text = title
        myImageView.image = UIImage(systemName: imageName)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myImageView.contentMode = .scaleAspectFit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
