//
//  AppDelegate.swift
//  LoginDialog
//
//  Created by 503-18 on 2018. 11. 7..
//  Copyright © 2018년 TaeMin Bang. All rights reserved.
//

import UIKit

// import는 링크 개념
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate{
	
	// nil을 저장할 수 있도록 문자열 변수를 생성
	var session:String!

	var window: UIWindow?

	// App이 실행될 때 호출되는 메소드 - App의 초기화를 수행
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// 알림 사용 여부를 질문
		let notiCenter = UNUserNotificationCenter.current()
		notiCenter.requestAuthorization(options: [.alert,.badge,.sound], completionHandler:{(didAllow, e) in }  )
		notiCenter.delegate = self
		
		return true
	}

	// App 실행 중에 App이 중지되어야 하는 경우 호출되는 메소드
	func applicationWillResignActive(_ application: UIApplication) {
		
		// 알림 사용 허가시
		UNUserNotificationCenter.current().getNotificationSettings(completionHandler: {settings in
			if settings.authorizationStatus == UNAuthorizationStatus.authorized{
				
				// 알림의 내용 생성
				let nContent = UNMutableNotificationContent()
				nContent.title = "알림 메시지"
				nContent.subtitle = "보조 메시지"
				nContent.body = "알림의 내용"
				nContent.sound = UNNotificationSound.default
				
				// userInfo는 다음 객체에게 넘어가는 부가 정보
				nContent.userInfo = ["name":"관리자"]
				
				// 알림 출력 시간 설정
				let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
				
				// 작업, 출력 시간을 하나로 만들기
				let request = UNNotificationRequest(identifier: "wake up", content: nContent, trigger: trigger)
				
				// 알림 등록
				UNUserNotificationCenter.current().add(request)}
			else{
				print("사용자가 알림을 사용하지 않겠다고 설정")
			}
		})
	}

	// 백그라운드에 있다가 알림이 왔을 때 호출되는 메소드
	func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
		if notification.request.identifier == "wakeup"{
			print(notification.request.content.userInfo["name"]!)
		}
	}
	
	// 알림을 클릭했을 때 호출되는 메소드
	func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
		if response.notification.request.identifier == "wakeup"{
			print(response.notification.request.content.userInfo["name"]!)
		}
	}
	
	func applicationDidEnterBackground(_ application: UIApplication) {
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
		// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(_ application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}


}

