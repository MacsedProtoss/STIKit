//
//  STIContentPopCellController.swift
//  STIKit
//
//  Created by Macsed on 2019/12/22.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import UIKit
import SnapKit

class STIContentPopCellController : STIContentCellController{
    
    convenience init(dataManager:STIPopDataManager,frame:CGRect){
           self.init()
           self.dataManager = dataManager //MARK: get date from network
           getView(frame:frame)
       }
    
    override func getView(frame:CGRect){
        
        cellView = STIContentPopCell(frame: frame, labelText: dataManager.cellInfo.name)
        
        view.addSubview(cellView)
        cellView.snp.makeConstraints { (make) in
            make.leading.trailing.top.bottom.equalToSuperview()
            
        }
    }
    
    
    
    
}

