//
//  ViewController.swift
//  ThridSDK-YYKit
//
//  Created by wenze on 2020/11/3.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         creatIntYYCahce()
        
    }
    
    func creatIntYYCahce(){
        let yy_cache = YYCache.init(name: "yy_swift_key")
        /// memoryCache:利用CFDictionary对象的 key-value开辟内存储存机制和双向链表原理来实现LRU算法
        yy_cache?.memoryCache.costLimit = 4*1024
        yy_cache?.memoryCache.countLimit = 50
        yy_cache?.diskCache.costLimit = 10 * 1024
        yy_cache?.diskCache.countLimit = 50
        yy_cache?.diskCache.autoTrimInterval = 60
        
    }


}

