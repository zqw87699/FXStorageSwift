//
//  FXStorageKeyChain.swift
//  TTSwift
//
//  Created by 张大宗 on 2017/5/18.
//  Copyright © 2017年 张大宗. All rights reserved.
//

import Foundation
import KeychainSwift

public class FXStorageKeyChain:IFXStorageProtocol {
    
    public static let sharedInstance = FXStorageKeyChain()

    var keychainStore = KeychainSwift.init(keyPrefix: Bundle.main.bundleIdentifier ?? "")

    public func hasObjectForKey(key: String) -> Bool {
        let valueString = self.keychainStore.get(key)
        let valueBool = self.keychainStore.getBool(key)
        let valueData = self.keychainStore.getData(key)
        if valueString == nil && valueBool == nil && valueData == nil {
            return false
        }else{
            return true
        }
    }
    
    public func boolForKey(key: String) -> Bool {
        let value = self.keychainStore.getBool(key)
        if value != nil {
            return value!
        }
        return false
    }
    
    public func setBool(value: Bool, forKey key: String) {
        self.keychainStore.set(value, forKey: key)
    }
    
    public func stringForKey(key: String) -> String? {
        return self.keychainStore.get(key)
    }
    
    public func setString(value: String, forKey key: String) {
        self.keychainStore.set(value, forKey: key)
    }
    
    public func dataForKey(key: String) -> Data? {
        return self.keychainStore.getData(key)
    }
    
    public func setData(data: Data, forKey key: String) {
        self.keychainStore.set(data, forKey: key)
    }
    
    public func objectForKey(key: String) -> Any? {
        let data = self.dataForKey(key: key)
        if data != nil && (data?.count)! > 0 {
            return NSKeyedUnarchiver.unarchiveObject(with: data!)
        }
        return nil;
    }
    
    public func setObject(object: Any, forKey key: String) {
        let data = NSKeyedArchiver.archivedData(withRootObject: object)
        self.setData(data: data, forKey: key)
    }

    public func removeObjectForKey(key: String) {
        self.keychainStore.delete(key)
    }
    
    public func removeAllObjects() {
        self.keychainStore.clear()
    }
    
    static public func getInstance() -> IFXStorageProtocol {
        return FXStorageKeyChain.sharedInstance
    }
}
