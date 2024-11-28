//
//  EmojiDemo.swift
//  SwiftUI-Demo
//
//  Created by ybwdaisy on 2024/11/14.
//

// https://fatbobman.com/zh/posts/understanding-swiftui-view-update-mechanism/

import SwiftUI

let emojis = ["😀", "😬", "😄", "🙂", "😗", "🤓", "😏", "😕", "😟", "😎", "😜", "😍", "🤪"]

struct EmojiDemo: View {
    var body: some View {
        TimelineView(.periodic(from: .now, by: 0.2)) { timeline in
            HStack(spacing: 120) {
                let randomEmoji = emojis.randomElement() ?? ""
                Text(randomEmoji)
                    .font(.largeTitle)
                    .scaleEffect(4.0)

                RightEmoji()
            }
        }
    }
}

struct RightEmoji: View {
     let id: Int = .random(in: 0 ... 100_000) // 打开这个就可以更新
    var body: some View {
        let randomEmoji = emojis.randomElement() ?? ""

        Text(randomEmoji)
            .font(.largeTitle)
            .scaleEffect(4.0)
    }
}
