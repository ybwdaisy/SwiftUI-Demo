//
//  Untitled.swift
//  SwiftUI-Demo
//
//  Created by ybwdaisy on 2024/11/28.
//

// https://fatbobman.com/zh/posts/the-anomaly-of-onchange-in-swiftui-multi-layer-navigation/

import SwiftUI

class OnChangeViewModel: ObservableObject {
    @Published var count = 0
}

struct OnChangeSubView: View {
    let level: Int
    @EnvironmentObject var viewModel: OnChangeViewModel
    var body: some View {
        VStack {
            // 通过打印 update，验证 viewModel.count 变化时视图的响应性
            let _ = print("level \(level) Updated")
            Button("Count++") {
                viewModel.count += 1
            }
            NavigationLink(value: level + 1) {
                Text("Goto Next Level")
            }
        }
        .buttonStyle(.borderedProminent)
        .navigationTitle(Text("Level: \(level)"))
        // 在每个层级通过 onChange 响应 viewModel.count 的变化
        .onChange(of: viewModel.count){ _ in
            print("Level *\(level)* onChanged")
        }
//        .task(id: viewModel.count){
//            print("Level *\(level)* onChanged in task(id:)")
//        }
//        .onReceive(viewModel.$count){ _ in
//            print("Level *\(level)* receive count notification")
//        }
    }
}

struct OnChangeContentView: View {
    @StateObject private var viewModel = OnChangeViewModel()
    var body: some View {
        NavigationStack {
            OnChangeSubView(level: 1)
                .navigationDestination(for: Int.self) { value in
                    OnChangeSubView(level: value)
                }
        }
        .environmentObject(viewModel)
    }
}
