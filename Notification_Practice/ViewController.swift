//
//  ViewController.swift
//  Notification_Practice
//
//  Created by daiki umehara on 2021/05/05.
//

import UIKit

class ViewController: UIViewController, UNUserNotificationCenterDelegate, UIWindowSceneDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if let error = error {
                print(error)
            }
        }
        
    }
    @IBAction func buttonDidTapped(_ sender: Any) {
        let center = UNUserNotificationCenter.current()
        center.getNotificationSettings { (setting) in
            guard setting.alertSetting == .enabled else {
                print("通知が許可されていません")
                return
            }
            
            let content = UNMutableNotificationContent()
            content.title = "テスト"
            content.body = "5分後に授業が始まります"
            content.sound = UNNotificationSound.default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let request = UNNotificationRequest(identifier: "uuid", content: content, trigger: trigger)
            
            let notificationCenter = UNUserNotificationCenter.current()
            notificationCenter.add(request) { (error) in
                if error != nil {
                    print(error!)
                }
            }
            
        }
    }
    
    
    
}

