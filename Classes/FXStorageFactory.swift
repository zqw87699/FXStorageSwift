//
//  FXStorageFactory.swift
//  TTSwift
//
//  Created by 张大宗 on 2017/5/18.
//  Copyright © 2017年 张大宗. All rights reserved.
//

import Foundation

public enum FXStorageType:Int {
    case FXStorageTypeUserDefault = 0//NSUserDefault可删除
    case FXStorageTypeKeyChain = 1//持久化缓存。无法删除
}

public class FXStorageFactory{
    
    /**
     *  获取缓存对象
     */
    public static func getStorageObject(type:FXStorageType)->IFXStorageProtocol{
        switch type {
        case .FXStorageTypeKeyChain:
            return FXStorageKeyChain.getInstance()
        case .FXStorageTypeUserDefault:
            return FXStorageUserDefault.getInstance()
        }
    }
    
}
