//
//  ContentView.swift
//  ConfigSwiftUIExamples
//
//  Created by Mustafa Karakus on 27.11.2021.
//

import SwiftUI
import Config

struct ContentViewRemote: View {
    
    @JSONValue(url: "https://raw.githubusercontent.com/mustafakarakus/Config/master/ConfigExamples/config.json", "application.appKey")
    var appKey: String = ""
    
    var body: some View {
        Text(appKey)
            .padding()
    }
}

struct ContentViewRemote_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewRemote()
    }
}
