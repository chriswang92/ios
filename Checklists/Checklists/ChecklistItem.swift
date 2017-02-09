//
//  ChecklistItem.swift
//  Checklists
//
//  Created by WangChenguang on 2017-02-07.
//  Copyright © 2017 WangChenguang. All rights reserved.
//

import Foundation
class ChecklistItem {
    var text = ""
    var checked = false
    func toggleChecked(){
        checked = !checked
    }
}