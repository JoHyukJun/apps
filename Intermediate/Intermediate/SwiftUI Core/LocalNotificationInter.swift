//
//  LocationNotificationInter.swift
//  Intermediate
//
//  Created by johyukjun on 11/2/24.
//

import SwiftUI
import UserNotifications


class NotificationManager {
    static let instance = NotificationManager()
    
    func requestAuthorization() {
        let option: UNAuthorizationOptions = [.alert, .badge, .sound]
        
        UNUserNotificationCenter.current().requestAuthorization(options: option) { success, error in
            if success {
                print("Authorization granted")
            } else if let error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        
        content.title = "Local Notification Test"
        content.subtitle = "Testing"
        content.sound = .default
        
        // 시간 기준: Interval - 몇 초 뒤에 울릴것인지 딜레이 설정 repeats 반복 여부 설정 (최소 1분)
        let timeTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 3.0, repeats: false)
        
        // 날짜 기준: DateMatching 은 DateComponent 기준에 맞게 알림
        var dateComponents = DateComponents()
        dateComponents.hour = 21 // hour 를 24시간 기준
        dateComponents.minute = 30
//        dateComponents.weekday = 1
        
        let calendarTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // Create request
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: timeTrigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancleNotification() {
        // peding notification 은 trigger 상에서 만족된 조건이 되어도 더이상 notification 되지 않게 하기
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

struct LocalNotificationInter: View {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        VStack(spacing: 20) {
            Button {
                NotificationManager.instance.requestAuthorization()
            } label: {
                Text("권한 요청")
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .padding()
                    .background(Color.green)
            }
            
            Button {
                NotificationManager.instance.scheduleNotification()
            } label: {
                Text("Time Notification Request")
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .padding()
                    .background(Color.green)
            }
            
            Button {
                NotificationManager.instance.scheduleNotification()
            } label: {
                Text("Calendar Notification Request")
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .padding()
                    .background(Color.green)
            }
            
            Button {
                NotificationManager.instance.cancleNotification()
            } label: {
                Text("Cancle Notification")
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .padding()
                    .background(Color.green)
            }
        } // VStack
        .onChange(of: scenePhase) { oldValue, newValue in
            if newValue == .active {
                print("scenes is active")
            }
        }
    }
}

#Preview {
    LocalNotificationInter()
}
