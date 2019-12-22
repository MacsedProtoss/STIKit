//
//  STIPopUpView.swift
//  STIKit
//
//  Created by Macsed on 2019/12/22.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import UIKit
import SnapKit

class STIPopUpView : UIView{
    
    
    private var contentTable : UIView!
    
    func setTable(view : UIView){
        self.addSubview(view)
        view.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalToSuperview().offset(PhoneType().isUsingSafeArea() ? (-22) : (-0))
        }
        
    }
    
    
}

