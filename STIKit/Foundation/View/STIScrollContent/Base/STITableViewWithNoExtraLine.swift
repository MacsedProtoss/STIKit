//
//  STITableViewWithNoExtraLine.swift
//  STIKit
//
//  Created by Macsed on 2019/12/17.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import UIKit

class STITableViewWithNoExtraLine: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame:frame,style:style)
        clearExtraLine()
    }
    
    func clearExtraLine(){
        let view = UIView()
        view.backgroundColor = UIColor.clear
        self.tableFooterView = view
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
