//
//  STIContentSwitchCell.swift
//  STIKit
//
//  Created by Macsed on 2019/12/22.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import UIKit
import SnapKit

class STIContentSwitchCell: STIContentCell {
    
    var swicher : UISwitch!
    var tableView : UIView?
    
    override init(frame:CGRect){
        super.init(frame:frame)
    }
    
    convenience init(frame:CGRect,labelText:String,subCellDetails:[cellDetail],isEnabled:Bool){
        self.init(frame:frame)
        label = getLabel(labelText: labelText)
        
        swicher = getSwitch(isEnabled:isEnabled)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTable(view : UIView,height:CGFloat){
        tableView = view
        self.addSubview(view)
        view.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(44)
            make.height.equalTo(height)
        }
        
    }
    
    func updateTableHeight(height : CGFloat){
        tableView!.snp.updateConstraints { (make) in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(44)
            make.height.equalTo(height)
        }
    }
    
    private func getSwitch(isEnabled : Bool) -> UISwitch{
        let swicher = UISwitch()
        swicher.isOn = isEnabled
        self.addSubview(swicher)
        swicher.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-22)
            make.centerY.equalTo(label!.snp.centerY)
        }
        return swicher
    }
    
    
}

