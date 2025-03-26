//
//  MailComposeViewController.swift
//  EmailDemo
//
//  Created by NEP on 2025/3/18.
//

import MessageUI
import SwiftUI

struct MailView: UIViewControllerRepresentable {
    let emailSubject = "My email title"
    
    func makeUIViewController(context: Context) -> MFMailComposeViewController {
//        guard MFMailComposeViewController.canSendMail() else {
//            print("cansendmail fail")
//            return
//        }
        let mail = MFMailComposeViewController()
        mail.mailComposeDelegate = context.coordinator
        
        // 配置邮件内容
        mail.setToRecipients(["2459674360@qq.com"])
        mail.setSubject("文件附件")
        mail.setMessageBody("请查看附件", isHTML: false)
        mail.setPreferredSendingEmailAddress("dingxudong32@gmail.com")
        
        return mail
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        var parent: MailView
        
        init(_ parent: MailView) {
            self.parent = parent
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController,
                                 didFinishWith result: MFMailComposeResult,
                                 error: Error?) {
            if let error = error {
                print("DEBUG", error)
            }
            controller.dismiss(animated: true)
        }
    }
}
