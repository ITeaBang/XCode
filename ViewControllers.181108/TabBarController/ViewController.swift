//
//  ViewController.swift
//  TabBarController
//
//  Created by 503-18 on 2018. 11. 8..
//  Copyright © 2018년 TaeMin Bang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		self.tabBarController?.delegate = self
	}
}

extension ViewController : UITabBarControllerDelegate{
	// 탭 바의 항목을 누른 후 호출되는 메소드
	func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
		
		print("\(tabBarController.selectedIndex)번 ViewController 선택")
		
	}
}
