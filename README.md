# Config

[![Build Status](https://travis-ci.org/mustafakarakus/Config.svg?branch=master)](https://travis-ci.org/mustafakarakus/Config)
[![Swift 4.2](https://img.shields.io/badge/Swift-4.2-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![CocoaPods](https://img.shields.io/cocoapods/v/Config.svg)](https://cocoapods.org/pods/Config)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)

  Config is a framework written in Swift that makes it easy for you to use JSON file as a configuration, with JSON keys in dot notation in your application.

## Requirements

* iOS 9.0+
* Xcode 10.0+
* Swift 4.2

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

Create a desired config file in **JSON** format in your Xcode project. 

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

```swift

import Config

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    Config.initialize(configPath: "config.json")
    return true
}

```

To reach your configuration in the app, you need to start with **Config.shared** then type your JSON keys with **dot notation** that described in JSON file. Last thing is call **.parse()** function.

Only thing that you need to know is *parse()* function is type inferred. That means you need to specify your data type in your variable/constant.

```swift 

let myIntegerValue:Int = Config.shared.myKey.myIntegerValue.parse()

```

## Examples

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

## What is next?

- [ ] Carthage
- [ ] Swift 5.x 
- [ ] Remote JSON 

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