//
//  ContentView.swift
//  SwiftUI-Demo
//
//  Created by ybwdaisy on 2024/11/14.
//

import SwiftUI

struct ContentView: View {
    @State var count = 0
    var body: some View {
        let _ = print("Evaluating View Declaration Value")
        Text("Count: \(count)")
        Text("Tap Me")
            .onTapGesture {
                count += 1
            }
        SubView1()
        SubView2(count: count)
    }
}

struct SubView1: View {
    init() {
        print("subview1 init")
    }

    var body: some View {
        let _ = print("subview1 body update")
        Text("No changes")
    }
}

struct SubView2: View {
    let count: Int
    init(count: Int) {
        self.count = count
        print("subview2 init")
    }

    var body: some View {
        let _ = print("subview2 body update")
        Text("Count Changes: \(count)")
    }
}

#Preview {
//    ContentView()
    EmojiDemo()
}
