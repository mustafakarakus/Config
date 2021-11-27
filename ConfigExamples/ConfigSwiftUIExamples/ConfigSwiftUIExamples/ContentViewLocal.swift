//
//  ContentView.swift
//  ConfigSwiftUIExamples
//
//  Created by Mustafa Karakus on 27.11.2021.
//

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

struct ContentViewLocal_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewLocal()
    }
}
