//
//  CellVC.swift
//  taab
//
//  Created by kiran on 9/4/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import UIKit

class CellVC: UITableViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsDescription: UILabel!
    @IBOutlet weak var newsAuthor: UILabel!
    @IBOutlet weak var newsReadMore: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
