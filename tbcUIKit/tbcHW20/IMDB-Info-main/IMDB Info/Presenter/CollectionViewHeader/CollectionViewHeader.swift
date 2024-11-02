//
//  CollectionViewHeader.swift
//  IMDB Info
//
//  Created by Nika Topuria on 27.10.21.
//

import UIKit

final class CollectionViewHeader: UICollectionReusableView {
    
    @IBOutlet private weak var headerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func makeNew(with header: String) {
        headerLabel.text = header
    }
}
