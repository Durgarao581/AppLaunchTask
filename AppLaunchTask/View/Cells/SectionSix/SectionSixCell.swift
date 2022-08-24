//
//  SectionSixCell.swift
//  AppLaunchTask
//
//  Created by Ganga Durgarao Kothapalli on 24/08/22.
//

import UIKit

class SectionSixCell: UICollectionViewCell {

    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var offerLbl: UILabel!
    @IBOutlet weak var resNameLbl: UILabel!
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var resImg: UIImageView!
    @IBOutlet weak var offerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        offerView.layer.cornerRadius = 12
        offerView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        // Initialization code
    }

}
