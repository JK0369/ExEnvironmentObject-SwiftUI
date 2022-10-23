//
//  ContentView.swift
//  ExEnv
//
//  Created by 김종권 on 2022/10/23.
//

import SwiftUI

struct ContentView: View {
  @StateObject var myObject = MyObservableObject()
  
  var body: some View {
    VStack {
      Text(myObject.isOn ? "isOn" : "isOff")
      Divider()
      MyView()
        .environmentObject(myObject)
    }
  }
}

struct MyView: View {
  @EnvironmentObject var myObject: MyObservableObject // ObservableObject타입을 준수해야됨
  
  var body: some View {
    Button(myObject.isOn ? "child, isOn" : "child, isOff") {
      myObject.isOn.toggle()
      print(myObject.isOn)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

class MyObservableObject: ObservableObject {
  @Published var isOn = false
}
