//
//  STIContentPopCell.swift
//  STIKit
//
//  Created by Macsed on 2019/12/22.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import UIKit
import SnapKit

class STIContentPopCell : STIContentCell {
    
    
    override init(frame:CGRect){
        super.init(frame:frame)
    }
    
    convenience init(frame:CGRect,labelText:String){
        self.init(frame:frame)
        
        label = getLabel(labelText: labelText)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

