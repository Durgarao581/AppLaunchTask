//
//  Header.swift
//  AppLaunchTask
//
//  Created by Ganga Durgarao Kothapalli on 24/08/22.
//

import Foundation
import UIKit

class Header : UICollectionReusableView {
    
    let label = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label.font = UIFont.systemFont(ofSize: 17.0, weight: .medium)
        label.text = "Eat what makes you happy"
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
