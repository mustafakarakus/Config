# Config

[![Build Status](https://travis-ci.org/mustafakarakus/Config.svg?branch=master)](https://travis-ci.org/mustafakarakus/Config)
[![Codebeat](https://codebeat.co/badges/7ab7f216-59bb-430b-9791-fab438fb3c05)](https://codebeat.co/projects/github-com-mustafakarakus-config-master)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-blue.svg?style=flat)](https://developer.apple.com/swiftui/)
[![Swift 5](https://img.shields.io/badge/Swift-5.5-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![CocoaPods](https://img.shields.io/cocoapods/v/Config.svg)](https://cocoapods.org/pods/Config)
[![Swift Package Manager](https://img.shields.io/badge/SPM-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![Carthage](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)

  Config is a framework written in Swift that makes it easy for you to use JSON file as a configuration, with JSON keys in dot notation in your application. Also supports SwiftUI!


## Table of contents
- [Requirements](#requirements)
- [Integration](#integration)
  - [Swift Package Manager](#swift-package-manager)
  - [CocoaPods](#cocoapods)
- [Usage](#usage)
  - [Instance](#usage-instance)
  - [Property Wrapper](#usage-property-wrapper)
  - [Pattern Matching](#usage-pattern-matching)
- [SwiftUI](#swiftui)
- [What is next?](#what-is-next)
- [Contribution](#contribution)
- [License](#license)

---

<a name="requirements" />

## Requirements

* iOS 15.0
* Xcode 13.1
* Swift 5.5

<a name="integration" />

## Integration

<a name="swift-package-manager" />

### Swift Package Manager

- In Xcode, open `File > Add Packages`. 
- Search **https://github.com/mustafakarakus/Config.git**
- Config should be listed. Click `Add Package`

<a name="cocoapods" />

### CocoaPods

You can use CocoaPods to install **Config** by adding it to your Podfile:

```Pod
use_frameworks!

target 'MyApp' do
    pod 'Config'
end
```

<a name="usage" />

## Usage

Create a desired config file in **JSON** format in your Xcode project or use a web url that returns a **JSON** 

```JSON

{
    "development": {
        "debug": true
    },
    "application": {
        "type":5,
        "version":1.2,
        "appKey":"ABCD-EFGH-IJKLMNOPR",
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

You have 3 options to read your **JSON** values, Choose the best way for you

* Instance
* Property Wrapper
* Pattern Matching

<a name="usage-instance" />

### Instance

* Initialize **Config** with the JSON file that exists in your directories. Or Use a JSON URL while initializing.

**Local File**

Add `my-config.json` file in the desired project directory

```swift

let config = Config(with: "my-config")

```

**Remote File**

Use a URL for your JSON file that exists on remote.

```swift

let config = Config(with: "https://raw.githubusercontent.com/mustafakarakus/Config/master/Tests/ConfigTests/ConfigFiles/mainConfig.json")

```

* Type your JSON keys with **dot notation** that described in JSON file. Last thing is call **.value()** function. *value()* function is type inferred. That means you need to specify your data type in your variable/constant.

```swift 

let myIntegerValue:Int = config.myKey.myIntegerValue.value() 

```

```swift

if let development:[String:Any] = config.development.value(){
    print(development)
}

```
#### Examples

```swift

import Config

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let config = Config(with: "my-config")

        if let development:[String:Any] = config.development.value() {
            print(development)
        }
        
        if let debug:Bool = config.development.debug.value(){
            print(debug)
        }
          
        if let application:[String:Any] = config.application.value(){
            print(application)
        }
        
        if let version:Double = config.application.version.value(){
            print(version)
        }
        
        if let applicationType:Int = config.application.type.value(){
            print(applicationType)
        }
        
        if let appKey:String = config.application.appKey.value(){
            print(appKey)
        }
        
        if let username:String = config.application.security.OAuth2.credentials.username.value(){
            print(username)
        }
        
        if let groups:[Int] = config.application.security.OAuth2.groups.value(){
            print(groups)
        }
        
        if let domainExceptions:[String] = config.application.security.domainExceptions.value(){
            print(domainExceptions)
        }
    }
}
```

<a name="usage-property-wrapper" />

### JSONValue Property Wrapper

* Mark your variable with Local JSON file name; **@JSONValue("my-json-file-name", "JSONKey")**

or

* Mark your variable with Remote JSON URL; **@JSONValue("http://www.mydomain.com/files/my-config.json", "JSONKey")**

*In this case 'application.security.OAuth2.groups' data type is an Int array in 'my-config.json' file (read the sample JSON file above)*

```swift

@JSONValue("my-config", "application.security.OAuth2.groups")
var groups: [Int] = [] 

```

```swift

@JSONValue(url: "https://raw.githubusercontent.com/mustafakarakus/Config/master/Tests/ConfigTests/ConfigFiles/mainConfig.json", "application.appKey")
var appKey: String = ""

```

#### Examples

```swift

import Config

class PropertyWrapperViewController: UIViewController {
     
    @JSONValue("my-config", "application.security.OAuth2.groups")
    var groups: [Int] = []
    
    @JSONValue("my-config1", "development")
    var development: [String:Any]  = [:]
    
    @JSONValue("my-config", "development.debug")
    var isDebug: Bool = false
    
    @JSONValue("my-config", "application.security.OAuth2.credentials.username")
    var username: String = ""
    
    @JSONValue(url: "https://raw.githubusercontent.com/mustafakarakus/Config/master/Tests/ConfigTests/ConfigFiles/mainConfig.json", "application.appKey")
    var appKey: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("groups: \(groups)")
        print("development: \(development)")
        print("debug mode: \(isDebug)")
        print("OAuth2 username: \(username)")
        print("App Key: \(appKey)") 
    }
}
```

<a name="usage-pattern-matching" />

### Pattern Matching

* Create an instance of **Config** then type your JSON keys with **dot notation** that described in JSON file. 
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
private var config: Config? {
    let sampleUrl = "https://raw.githubusercontent.com/mustafakarakus/Config/master/Tests/ConfigTests/ConfigFiles/mainConfig.json"
    guard let url = URL(string: sampleUrl) else { return nil }
    return Config(with: url)
}

let string = config?.application.appKey
if case let .string(val) = string {
    print("app Key \(val)")
}
    
```

#### Examples

```swift

import Config

class PatternMatchingViewController: UIViewController {
    
    private var config: Config? {
        let sampleUrl = "https://raw.githubusercontent.com/mustafakarakus/Config/master/ConfigExamples/config.json"
        guard let url = URL(string: sampleUrl) else { return nil }
        return Config(with: url)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let string = config?.application.appKey
        if case let .string(val) = string {
            print("app Key \(val)")
        }
        
        let double = config?.application.version
        if case let .double(val) = double {
            print("version: \(val)")
        }
        
        let intArray = config?.application.security.OAuth2.groups
        if case let .array(val) = intArray {
            for item in val {
                print("groups: \(String(describing: item.intValue))")
            }
        }

        let dictionary = config?.application
        if case let .object(val) = dictionary {
            print("application: \(val)")
        }
    }
}

```

<a name="swiftui" />

### SwiftUI

Config now supports SwiftUI. Using the **JSONValue** Property Wrapper in the SwiftUI variable will bind the data from your JSON source, local or remote.

```swift
import SwiftUI
import Config

struct ContentViewLocal: View {
    
    @JSONValue("my-config", "application.security.OAuth2.credentials.username")
    var name: String = ""
    
    var body: some View {
        Text(name)
            .padding()
    }
}
```

```swift
import SwiftUI
import Config

struct ContentViewRemote: View {
    
    @JSONValue(url: "https://raw.githubusercontent.com/mustafakarakus/Config/master/Tests/ConfigTests/ConfigFiles/mainConfig.json", "application.appKey")
    var appKey: String = ""
    
    var body: some View {
        Text(appKey)
            .padding()
    }
}
```

<a name="what-is-next" />

## What is next?

- [x] Carthage
- [x] Swift Package Manager
- [x] Remote JSON 
- [x] Swift 5.x 
- [x] Property Wrappers
- [x] Use instance instead of Singleton
- [x] SwiftUI

<a name="contribution" />

## Contribution

Anyone who would like to contribute to the project is more than welcome.

* Fork this repo
* Make your changes
* Submit pull request

<a name="license" />

## License

MIT License

Copyright (c) 2021 mustafakarakus

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