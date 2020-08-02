//
//  NotificationHelper.swift
//  PomPom Timer
//
//  Created by Emad Rahman on 2020-08-02.
//  Copyright © 2020 Emad Rahman. All rights reserved.
//

import SwiftUI

class NotificationHelper {
    func getContent() -> UNMutableNotificationContent {
        let content = UNMutableNotificationContent()
        content.title = "Session Complete"
        content.body = "You've completed 20 minutes!"
        content.sound = UNNotificationSound.default
        
        return content
    }
    
    func getTrigger(timeIntervalInSeconds: Double) -> UNTimeIntervalNotificationTrigger {
        return UNTimeIntervalNotificationTrigger(timeInterval: timeIntervalInSeconds, repeats: false)
    }
    
    func getRequest(timeIntervalInSeconds: Double) -> UNNotificationRequest {
        return UNNotificationRequest(identifier: "pompom_notification_id", content: getContent(), trigger: getTrigger(timeIntervalInSeconds: timeIntervalInSeconds))
    }
    
    func sendNotificationRequestToNotificationCenter(timeIntervalInSeconds: Double) -> Void {
        UNUserNotificationCenter.current().add(getRequest(timeIntervalInSeconds: timeIntervalInSeconds))
    }
    
    func removeAllApplicationNotificationsFromNotificationCenter() -> Void {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}
