//
//  DataCell.swift
//  testUiTableView
//
//  Created by Apple on 18.10.24.
//

import UIKit

class DataCell: UITableViewCell {
    
    let infoLable = UILabel()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
#Preview(){
    DataCell()
}

