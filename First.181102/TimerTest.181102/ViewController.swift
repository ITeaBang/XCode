//
//  ViewController.swift
//  TimerTest.181102
//
//  Created by 503-18 on 2018. 11. 2..
//  Copyright © 2018년 TaeMin Bang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	// Timer가 수행할 메소드
	@objc func timerProc(){
		// 현재 날짜 가져오기
		let date = Date()
		// 날짜를 문자열로 변경하기 위한 클래스의 객체 만들기
		let fomatter = DateFormatter()
		// 문자열 형식 만들기
		fomatter.dateFormat = "yyyy-MM-dd ccc hh:mm:ss"
		// 레이블에 날짜를 문자열로 변경해서 출력
		label.text = fomatter.string(from: date)
	}
	override func viewDidLoad() {
		super.viewDidLoad()
			Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerProc), userInfo: nil, repeats: true)
	}

	@IBOutlet weak var label: UILabel!
	
}

