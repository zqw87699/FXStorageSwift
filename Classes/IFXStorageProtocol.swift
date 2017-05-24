//
//  IFXStorageProtocol.swift
//  TTSwift
//
//  Created by 张大宗 on 2017/5/18.
//  Copyright © 2017年 张大宗. All rights reserved.
//

import Foundation

public protocol IFXStorageProtocol {
    /**
     *  是否存在key
     *
     *  @param key 键值
     *
     *  @return 是否存在
     */
    func hasObjectForKey(key:String)->Bool
    
    /**
     *  获取bool类型数据
     *
     *  @param key 键
     *
     *  @return value
     */
    func boolForKey(key:String)->Bool

    
    /**
     *  设置bool类型数据
     *
     *  @param value 数据
     *  @param key   键
     */
    func setBool(value:Bool,forKey key:String)
    
    /**
     *  获取字符串data
     *
     *  @param key 键
     *
     *  @return value
     */
    func stringForKey(key:String)->String?

    
    /**
     *  设置字符串类型数据
     *
     *  @param value 数据
     *  @param key   键
     */
    func setString(value:String,forKey key:String)

    /**
     *  返回NSData数据
     *
     *  @param key 键
     *
     *  @return value
     */
    func dataForKey(key:String)->Data?
    /**
     *  设置NSData类型数据
     *
     *  @param data 数据
     *  @param key  键
     */
    func setData(data:Data,forKey key:String)
    
    /**
     *  获取对象值
     *
     *  @param key 键值
     *
     *  @return 对应值
     */
    func objectForKey(key:String)->Any?
    
    /**
     *  设置对象值
     *
     *  @param object 值（如果key 为空，表示删除key）
     *  @param key    键值
     */
    func setObject(object:Any,forKey key:String)
    
    /**
     *  删除key
     *
     *  @param key 键值
     */
    func removeObjectForKey(key:String)

    /**
     *  删除所有对象值
     */
    func removeAllObjects()

    /**
     *  得到缓存示例对象
     */
    static func getInstance()->IFXStorageProtocol
}
