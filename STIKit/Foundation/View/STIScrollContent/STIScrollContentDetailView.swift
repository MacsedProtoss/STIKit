//
//  STIScrollContentDetailView.swift
//  STIKit
//
//  Created by Macsed on 2019/12/17.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import UIKit
import SnapKit

class STIScrollContentDetailView: UIView {
    
    var contentTable : STITableViewWithNoExtraLine!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentTable = getTable()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getTable() -> STITableViewWithNoExtraLine{
        let table = STITableViewWithNoExtraLine()
        self.addSubview(table)
        table.snp.makeConstraints{(make) in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        return table
    }
    
    
    
    
}
