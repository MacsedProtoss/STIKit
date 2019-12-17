//
//  STIContentCellController.swift
//  STIKit
//
//  Created by Macsed on 2019/12/17.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import UIKit
import SnapKit

class STIContentCellController : UIViewController,UITextFieldDelegate{
    
    var dataManager : STICellDataManager!
    var cellView : STIContentCell!
    
    convenience init(dataManager : STICellDataManager,frame:CGRect){
        self.init()
        self.dataManager = dataManager
        getView(frame:frame)
    }
    
    func getView(frame:CGRect){
        cellView = STIContentCell(frame:frame,labelText: dataManager.cellInfo.name, placeholderText: "plz set".localized)
        cellView.textField.delegate = self
        view.addSubview(cellView)
        cellView.snp.makeConstraints { (make) in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
}

