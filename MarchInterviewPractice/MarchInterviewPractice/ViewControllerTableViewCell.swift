//
//  ViewControllerTableViewCell.swift
//  MarchInterviewPractice
//
//  Created by SATABHISHA ROY on 07/03/19.
//  Copyright © 2019 SATABHISHA ROY. All rights reserved.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
