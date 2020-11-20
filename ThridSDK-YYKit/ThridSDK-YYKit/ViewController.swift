//
//  ViewController.swift
//  ThridSDK-YYKit
//
//  Created by wenze on 2020/11/3.
//

import UIKit

class ViewController: UIViewController {

    var threadLock:pthread_mutex_t? = pthread_mutex_t()
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var subContentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       //  creatIntYYCahce()
        creatYYModel()
        yy_view()
        
        // 初始化锁
        //pthread_mutex_t =
//        pthread_mutex_init(&(threadLock!), nil)
//
//        // 加锁
//        pthread_mutex_lock(&(threadLock!))
//
//        // 解锁
//        pthread_mutex_unlock(&(threadLock!))
//
//        // 判断是加锁 ,没有加锁 0
//        if pthread_mutex_trylock(&(threadLock!)) == 0 {
//
//        }
        
        
    }
    

    /// 缓存
    func creatIntYYCahce(){
        let yy_cache = YYCache.init(name: "yy_swift_key")
        /// memoryCache:利用CFDictionary对象的 key-value开辟内存储存机制和双向链表原理来实现LRU算法,可以考虑将SDWebview的内存缓存策略缓存NSCache 换成YYmemoryCache
        yy_cache?.memoryCache.costLimit = 4*1024
        yy_cache?.memoryCache.countLimit = 50
        yy_cache?.diskCache.costLimit = 10 * 1024
        yy_cache?.diskCache.countLimit = 50
        yy_cache?.diskCache.autoTrimInterval = 60
        
        //缓存一个字符串
        let saveString:NSString = "缓存"
        //NSCoding
        yy_cache?.setObject(saveString, forKey: "string_key")
        
        // 缓存一张图片
        let cache_image = UIImage.init(named: "1")
        
        yy_cache?.setObject(cache_image, forKey: "image_key")
        
        let checkString =  yy_cache?.object(forKey: "string_key")
        NSLog(checkString as! String)
        
        let checekImage = yy_cache?.object(forKey: "image_key")
        print(checekImage)
        //NSLog(checekImage)
        
        // 删除缓存
//        yy_cache?.removeAllObjects {
//
//        }
        
    }
    
    func creatYYModel() {
        
        let personBundle  = Bundle.main.path(forResource: "person", ofType: "json")
        let jsonData = NSData(contentsOfFile: personBundle ?? "")
        
        if jsonData == nil {
            return
        }
        let  dicJson:Dictionary = try!JSONSerialization.jsonObject(with: jsonData! as Data, options: JSONSerialization.ReadingOptions.mutableLeaves) as! Dictionary<String, Any>
        let links:Array = dicJson["links"] as! Array<Any>
        for personDic in links  {
            
            // json -- model
            let personModel = Person.model(with: personDic as! [AnyHashable : Any])
            
            let personModel_josn = Person.model(withJSON: personDic);
            
            print("姓名:\(personModel?.name ?? "") 年龄:\(personModel?.age ?? 0)")
            
            print("姓名:\(personModel_josn?.name ?? "") 年龄:\(personModel_josn?.age ?? 0)")
            
            // model --- json
            let per_Dic = personModel?.modelToJSONObject();
            if per_Dic != nil{
                print(per_Dic!)
            }
           
            
        }
        
        
    }
    
    func creatMethodSignature()  {
        let personModel = Person.init()
        personModel.className()
        personModel.removeAssociatedValues()
        personModel.deepCopy()
        
        //personModel.perform(nil, with: nil)
    }
    
    func yy_view(){
        
        // x = ax + cy + tx 转变
        // y = bx + dy + ty 转变
        
       // let tf   = __CGAffineTransformMake(<#T##a: CGFloat##CGFloat#>, <#T##b: CGFloat##CGFloat#>, <#T##c: CGFloat##CGFloat#>, <#T##d: CGFloat##CGFloat#>, <#T##tx: CGFloat##CGFloat#>, <#T##ty: CGFloat##CGFloat#>)
        
        let tf   = __CGAffineTransformMake(0.3, 0, 0, 0.5, 0, 0);
        self.subContentView.transform = tf
        
        // 截屏 快照
       let shotImage = contentView.snapshotImage();
        //   截屏 快照  比  contentView.snapshotImage();
       let af_shotImage =  contentView.snapshotImage(afterScreenUpdates: false)
        print(shotImage as Any)
        
        if af_shotImage != nil {
            print(af_shotImage!)
        }
       
        // pdf
        let pdfData = contentView.snapshotPDF()
        
        if pdfData != nil {
            print(pdfData!)
        }
       
        print(self.subContentView.visibleAlpha);
        
        print( contentView.convert(CGPoint(x: 100, y: 100), toViewOrWindow: self.subContentView))
        
        
        
    }
    

}





