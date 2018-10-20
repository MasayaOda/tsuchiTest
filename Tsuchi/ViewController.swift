//
//  ViewController.swift
//  Tsuchi
//
//  Created by 小田将也 on 2018/10/20.
//  Copyright © 2018年 odamasaya. All rights reserved.
//

import UIKit
import UserNotifications // これのインポートが必須

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 通知を使用可能にする設定
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, error) in
            // エラー処理
        }
        
        // 通知自体の設定
        let content = UNMutableNotificationContent()
        
        content.title = NSString.localizedUserNotificationString(forKey: "通知タイトル", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "通知するメッセージ", arguments: nil)
        content.sound = UNNotificationSound.default
        
        // アプリを起動して5秒後に通知を送る
        
        var fireDate = DateComponents()
        fireDate.hour = 10
        fireDate.minute = 9
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: fireDate, repeats: false)
        
        let request = UNNotificationRequest(identifier: "my-notification", content: content, trigger: trigger)
        
        // 通知を登録
        center.add(request) { (error : Error?) in
            if error != nil {
                // エラー処理
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
