//
//  STIPopUpViewController.swift
//  STIKit
//
//  Created by Macsed on 2019/12/22.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import UIKit
import SnapKit

class STIPopUpViewController: STINavigationViewController {
    
    var mainView : STIPopUpView!
    var dataManager : STIPageDataManager!
    var contentTableController : STIScrollContentDetailViewController!
    
    convenience init(name:String,dataManagers : [STICellDataManager]){
        self.init()
        navBar = getNavBar(needUp:true)
        leftBtnTitle = "back"
        rightBtnTitle = "delete"
        viewTitle = name
        getMainView()
        contentTableController = STIScrollContentDetailViewController(cellDataManagers: dataManagers)
        mainView.setTable(view: contentTableController.view)
    }
    
    func getMainView(){
        mainView = STIPopUpView()
        view.addSubview(mainView)
        
        mainView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(44)
        }
        
    }
    
}



