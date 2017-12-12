# ALamofireTest

- [Alamofire(swift版afnetworking)](#alamofire)

https://github.com/anchoriteFili/Alamofire
```
target 'ALamofireTest' do
pod 'Alamofire', '~> 4.5'
end
```
### 调用的相关方法
```
/*  接口post请求
*  url: 传过来的url
*  param: 传过来的接口个性参数
*  complete：接口返回的参数
*/
class func post(url: String?, param: NSMutableDictionary, complete: @escaping (HTTPURLResponse?, Result<String>) -> Void ) -> Void {

    // 如果发过来的链接长度为空，则直接返回，不做任何反应
    guard let urlString = url, strlen(url) > 0 else {
        return
    }

    // 发起post申请
    let request: Alamofire.Request? = Alamofire.request(urlString, method: .post)
    // 如果是数据类型的请求
    if let request = request as? DataRequest {

        request.responseString(completionHandler: { response in
            complete(response.response, response.result)
        })
    }
}

```
### Alamofire(swift版afnetworking)
调用接口实例
```
let urlString = "http://www.gonghuizhudi.com/jiekou.php"
HYHttpTool.post(url: urlString, param: [:]) { (response, result) in
    let dic: NSDictionary = String.getDictionaryFromJSONString(jsonString: result.value!)
    print(dic.value(forKey: "headers") as Any)
}
```
用到的扩展
```
// 扩充String
extension String {

/*
* 将json字符串在转化为json字典
*/
static func getDictionaryFromJSONString(jsonString:String) ->NSDictionary{

    let jsonData:Data = jsonString.data(using: .utf8)!

    let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
    if dict != nil {
        return dict as! NSDictionary
    }
    return NSDictionary()
}

/*
* 将json字典转化为json字符串
*/
static func getJSONStringFromDictionary(dictionary:NSDictionary) -> String {
    if (!JSONSerialization.isValidJSONObject(dictionary)) {
        print("无法解析出JSONString")
        return ""
    }
    let data : NSData! = try? JSONSerialization.data(withJSONObject: dictionary, options: []) as NSData!
    let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
    return JSONString! as String
    }
}

```

