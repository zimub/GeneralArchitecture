//
//  Bundle _ Extension.swift
//  反射机制的封装
//
//  Created by pgw on 17/4/12.
//  Copyright © 2017年 pgw. All rights reserved.
//

import Foundation

extension Bundle{
    
    
    var nameSpace : String{
        
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
    
}
