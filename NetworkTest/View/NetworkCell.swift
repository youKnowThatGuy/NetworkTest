//
//  NetworkCell.swift
//  NetworkTest
//
//  Created by Клим on 22.11.2020.
//

import UIKit

class NetworkCell: UITableViewCell {
    
    @IBOutlet weak var nameOutlet: UILabel!
    
    
    @IBOutlet weak var birthOutlet: UILabel!
    
    @IBOutlet weak var genderOutlet: UILabel!
    
    @IBOutlet weak var heightOutlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //self.backgroundView = UIImageView(image: UIImage(named:"back"))
        self.backgroundColor = UIColor(white: 1, alpha: 0.5)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
