# Config

[![Build Status](https://travis-ci.org/mustafakarakus/Config.svg?branch=master)](https://travis-ci.org/mustafakarakus/Config)
[![Codebeat](https://codebeat.co/badges/7ab7f216-59bb-430b-9791-fab438fb3c05)](https://codebeat.co/projects/github-com-mustafakarakus-config-master)
[![Swift 5](https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![CocoaPods](https://img.shields.io/cocoapods/v/Config.svg)](https://cocoapods.org/pods/Config)
[![Swift Package Manager](https://img.shields.io/badge/SPM-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![Carthage](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)

  Config is a framework written in Swift that makes it easy for you to use JSON file as a configuration, with JSON keys in dot notation in your application.

## Requirements

* iOS 10.0+
* Xcode 10.2+
* Swift 5

## Integration

### CocoaPods

You can use CocoaPods to install **Config** by adding it to your Podfile:

```Pod
use_frameworks!

target 'MyApp' do
    pod 'Config'
end
```

## Usage

Create a desired config file in **JSON** format in your Xcode project or use a web url that returns a **JSON** 

```JSON

{
    "development": {
        "debug": true
    },
    "application": {
        "type":5,
        "version": 1.2,
        "appKey": "ABCD-EFGH-IJKLMNOPR",
        "security":{
            "OAuth2":{
                "credentials":{
                    "username":"mustafakarakus",
                    "password":"password"
                },
                "groups":[1,9,0,5],
                "chain":false
            },
            "domainExceptions":[
                "https://www.google.com",
                "https://www.twitter.com"
            ]
        }
    }
}

```

in *AppDelegate*, initialize your *config.json* first.

### Local JSON file

```swift

import Config

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    Config.initialize(with: "config.json") 
    return true
}

```

### Web URL JSON

```swift

import Config

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
     
    if let url = URL(string: "your-JSON-Endpoint-URL"){
        Config.initialize(with: url)
    }

    return true
}

```

You have 3 options to read your **JSON** values, Choose the best way for you

* Property Wrapper
* Pattern Matching
* In-Function

### 'JSONValue' Property Wrapper

* Mark your variable with **@JSONValue("JSONKey")**

*In that case 'application.security.OAuth2.groups' data type is an Int array (read the sample JSON file above)*
```swift

@JSONValue("application.security.OAuth2.groups")
var groups: [Int] = [] 

```

#### Examples

```swift

import Config

class PropertyWrapperViewController: UIViewController {
    
    @JSONValue("application.security.OAuth2.groups")
    var groups: [Int] = []
    
    @JSONValue("development")
    var development: [String:Any]  = [:]
    
    @JSONValue("development.debug")
    var isDebug: Bool = false
    
    @JSONValue("application.security.OAuth2.credentials.username")
    var username: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("groups: \(groups)")
        print("development: \(development)")
        print("debug mode: \(isDebug)")
        print("OAuth2 username: \(username)") 
    }
    
}
```

### In-Function

* Start with **Config.shared** then type your JSON keys with **dot notation** that described in JSON file. Last thing is call **.parse()** 
* Important, *parse()* function is type inferred. That means you need to specify your data type in your variable/constant.

```swift 

let myIntegerValue:Int = Config.shared.myKey.myIntegerValue.parse()

```

```swift

if let development:[String:Any] = Config.shared.development.parse(){
    print(development)
}

```

#### Examples

```swift

import Config

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let development:[String:Any] = Config.shared.development.parse(){
            print(development)
        }
        
        if let debug:Bool = Config.shared.development.debug.parse(){
            print(debug)
        }
        
        if let application:[String:Any] = Config.shared.application.parse(){
            print(application)
        }
        
        if let version:Double = Config.shared.application.version.parse(){
            print(version)
        }
        
        if let applicationType:Int = Config.shared.application.type.parse(){
            print(applicationType)
        }
        
        if let appKey:String = Config.shared.application.appKey.parse(){
            print(appKey)
        }
        
        if let username:String = Config.shared.application.security.OAuth2.credentials.username.parse(){
            print(username)
        }
        
        if let groups:[Int] = Config.shared.application.security.OAuth2.groups.parse(){
            print(groups)
        }
        
        if let domainExceptions:[String] = Config.shared.application.security.domainExceptions.parse(){
            print(domainExceptions)
        }  
    }
}
```

### Pattern Matching

* Start with **Config.shared** then type your JSON keys with **dot notation** that described in JSON file. 
* Use Swift's Pattern matching power with the following cases

```
.string(val)
.int(val)
.double(val)
.bool(val)
.object(val)
.array(val) 
```

```swift

let string = Config.shared.application.appKey
if case let .string(val) = string {
    print("app Key \(val)")
}
    
```

#### Examples

```swift

import Config

class PatternMatchingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let string = Config.shared.application.appKey
        if case let .string(val) = string {
            print("app Key \(val)")
        }
        
        let intArray = Config.shared.application.security.OAuth2.groups
        if case let .array(val) = intArray {
            print("groups: \(val)")
        }
        
        let dictionary = Config.shared.application
        if case let .object(val) = dictionary {
            print("application: \(val)")
        }
        
        let double = Config.shared.application.version
        if case let .double(val) = double {
            print("version: \(val)")
        }
    }  
}

```

## What is next?

- [x] Carthage
- [x] Swift Package Manager
- [x] Remote JSON 
- [x] Swift 5.x 
- [x] Property Wrappers

## Contribution

Anyone who would like to contribute to the project is more than welcome.

* Fork this repo
* Make your changes
* Submit pull request


## License

MIT License

Copyright (c) 2019 mustafakarakus

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.