//
//  CellTableViewCell.swift
//  Koreo
//
//  Created by Lucas Farah on 5/22/16.
//  Copyright © 2016 Lukas Kasimor. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {

  @IBOutlet weak var lblTeacherName: UILabel!
  @IBOutlet weak var lblClassName: UILabel!

  @IBOutlet weak var lblClassBlock: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
