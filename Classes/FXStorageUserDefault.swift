//
//  FXStorageUserDefault.swift
//  TTSwift
//
//  Created by 张大宗 on 2017/5/18.
//  Copyright © 2017年 张大宗. All rights reserved.
//

import Foundation

public class FXStorageUserDefault: IFXStorageProtocol {
    
    public static let sharedInstance = FXStorageUserDefault()
    
    var userDefaults = UserDefaults.standard
    
    public func hasObjectForKey(key: String) -> Bool {
        let value = self.userDefaults.object(forKey: key)
        return value != nil ? true:false
    }
    
    public func boolForKey(key: String) -> Bool {
        return self.userDefaults.bool(forKey:key)
    }
    
    public func setBool(value: Bool, forKey key: String) {
        self.userDefaults.set(value, forKey: key)
        self.userDefaults.synchronize()
    }
    
    public func stringForKey(key: String) -> String? {
        return self.userDefaults.string(forKey: key)
    }
    
    public func setString(value: String, forKey key: String) {
        self.userDefaults.set(value, forKey: key)
        self.userDefaults.synchronize()
    }
    
    public func dataForKey(key: String) -> Data? {
        return self.userDefaults.data(forKey: key)
    }
    
    public func setData(data: Data, forKey key: String) {
        self.userDefaults.setValue(data, forKey: key)
        self.userDefaults.synchronize()
    }
    
    public func objectForKey(key: String) -> Any? {
        return self.userDefaults.object(forKey: key)
    }
    
    public func setObject(object: Any, forKey key: String) {
        self.userDefaults.setValue(object, forKey: key)
        self.userDefaults.synchronize()
    }
    
    public func removeObjectForKey(key: String) {
        self.userDefaults.removeObject(forKey: key)
        self.userDefaults.synchronize()
    }
    
    public func removeAllObjects() {
        UserDefaults.resetStandardUserDefaults()
        self.userDefaults = UserDefaults.standard
    }
    
    static public func getInstance() -> IFXStorageProtocol {
        return FXStorageUserDefault.sharedInstance
    }
}
