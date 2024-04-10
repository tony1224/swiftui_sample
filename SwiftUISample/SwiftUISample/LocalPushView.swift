//
//  LocalPushView.swift
//  SwiftUISample
//
//  Created by admin on 2024/04/10.
//

import SwiftUI
import UserNotifications

struct LocalPushView: View {
    var body: some View {
        VStack(spacing: 16) {
            Button {
                let center = UNUserNotificationCenter.current()
                center.requestAuthorization(options: .alert) { granted, error in
                    if granted {
                        print("許諾された")
                    } else {
                        print("拒否された")
                    }
                }
            } label: {
                Text("許諾申請ボタン")
            }

            Button {
                sendNotificationRequest()
            } label: {
                Text("通知アクション")
            }

        }
    }

    private func sendNotificationRequest() {
        let content = UNMutableNotificationContent()
        content.title = "通知タイトル"
        content.body = "通知ボディ"
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "identifier", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}

struct LocalPushView_Previews: PreviewProvider {
    static var previews: some View {
        LocalPushView()
    }
}
