//
//  Infinite4Pager.swift
//  SwiftUI-Demo
//
//  Created by ybwdaisy on 2024/11/28.
//

// https://fatbobman.com/zh/posts/developing-an-infinite-four-direction-scrollable-pager-with-swiftui/

import SwiftUI
import Infinite4Pager

struct Infinite4PagerView: View {
    var body: some View {
        Infinite4Pager(
            initialHorizontalPage: 0,
            initialVerticalPage: 0,
            totalHorizontalPage: 5,
            totalVerticalPage: 5,
            enableClipped: false,
            enablePageVisibility: true,
            getPage: { h, v in
                PageView(h: h, v: v)
            }
        )
        .ignoresSafeArea()
    }
}

struct PageView: View {
    let h: Int
    let v: Int
    let images = ["image1", "image2", "image3", "image4", "image5"]
    @Environment(\.pagerCurrentPage) var mainPage
    @State var percent: Double = 0
    @State var isCurrent = false
    var body: some View {
        VStack {
            let index = abs((h + v) % (images.count - 1))
            Color.clear
                .overlay(
                    Image(images[index])
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .overlay(
                            VStack {
                                Text("\(h),\(v)")
                                Text("visibility \(percent)")
                                Text("isCurrent:\(isCurrent)")
                            }
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundColor(.black)
                                )
                        )
                )
                .onPageVisible { percent in
                    if let percent {
                        self.percent = percent
                    }
                }
                .task(id: mainPage) {
                    if let mainPage {
                        if mainPage.horizontal == h, mainPage.vertical == v {
                            isCurrent = true
                        }
                    }
                }
                .clipped()
        }
    }
}
