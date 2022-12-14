//
//  ConversationTableViewCell.swift
//  Eduapp
//
//  Created by Hamza-Arij on 11/12/2022.
//

import UIKit

class ConversationTableViewCell: UITableViewCell {

    @IBOutlet weak var messagechatlabel: UILabel!
    @IBOutlet weak var usernamechatlabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
