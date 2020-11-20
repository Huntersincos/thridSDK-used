//
//  Person.swift
//  ThridSDK-YYKit
//
//  Created by wenze on 2020/11/5.
//

import UIKit

class Person: NSObject,YYModel,NSCoding{
    
   // 主要添加@objc
    @objc var name:String?
    @objc var sex:String?
    @objc var age:Int = 0
    @objc var personID:Int = 0
    
    override init() {
        super.init()
    }

    func encode(with coder: NSCoder) {
        //type(of: self).init() // 存储
        self.modelEncode(with: coder)

    }

     required convenience init?(coder: NSCoder) {
        //存储
        self.init()
        self.modelInit(with: coder)
    }


    override var description: String{
        // 存储
        return modelDescription()
    }
    
   @objc func one1() {
        print("你好1")
    }
    
   @objc func one2() {
        print("你好2")
    }
    
   @objc func one3() {
        print("你好3")
    }
    
    ///
//    static func modelContainerPropertyGenericClass() -> [String : Any]? {
//        return ["":Person.classForCoder()]
//    }

    
    /// json和mode 属性不一致的情况下问题
//    static func modelCustomPropertyMapper() -> [String : Any]? {
//
//    }
    
}
