//
//  ViewController.swift
//  TouchEvent
//
//  Created by 503-18 on 2018. 11. 6..
//  Copyright © 2018년 TaeMin Bang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var lblState: UILabel!
	@IBOutlet weak var lblCount: UILabel!
	
	// Touch 관련 메소드 작성
	// Touch를 시작할 때 호출되는 메소드
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		// Touch를 1번하면 touches에서 1번째 데이터를 출력
		let touch = touches.first
		lblCount.text = "\(touch!.tapCount)번 Tap"
		lblState.text = "Touch 시작"
	}
	
	// Touch가 이동할 때 호출되는 메소드
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
		lblState.text = "Touch 이동 중"
		// 발생한 Touch 가져오기
		let touch = touches.first
		// imageView에서 Touch가 이동시 좌표를 imageView의 중앙점으로 설정
		if touch!.view == imageView {
			imageView.center = touch!.location(in: self.view)
		}
	}
	
	// Touch가 종료될 때 호출되는 메소드
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		lblState.text = "Touch 종료"
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
}


