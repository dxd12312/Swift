//
//  ContentView.swift
//  EmailDemo
//
//  Created by NEP on 2025/3/18.
//

import SwiftUI
import MessageUI

struct ContentView: View {
    @State private var showMailView = false
    var body: some View {
        VStack {
            Button {
                if MFMailComposeViewController.canSendMail() {
                    showMailView.toggle()
                } else {
                    print("未配置邮件账户")
                }
            } label: {
                Text("发送")
            }

        }
        .sheet(isPresented: $showMailView) {
            MailView()
        }
        .padding()
    }
    // 获取本地文件路径（示例）
        private func getFileURL() -> URL? {
            guard let path = Bundle.main.path(forResource: "demo", ofType: "pdf") else {
//                alertMessage = "文件未找到"
                return nil
            }
            return URL(fileURLWithPath: path)
        }
}

#Preview {
    ContentView()
}
