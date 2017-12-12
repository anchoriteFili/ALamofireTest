//
//  ViewController.swift
//  ALamofireTest
//
//  Created by zetafin on 2017/12/12.
//  Copyright © 2017年 赵宏亚. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let urlString = "http://www.gonghuizhudi.com/jiekou.php"
        HYHttpTool.post(url: urlString, param: [:]) { (response, result) in
            let dic: NSDictionary = String.getDictionaryFromJSONString(jsonString: result.value!)
            
            print(dic.value(forKey: "headers") as Any)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

