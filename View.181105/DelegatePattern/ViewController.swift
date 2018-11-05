//
//  ViewController.swift
//  DelegatePattern
//
//  Created by 503-18 on 2018. 11. 5..
//  Copyright © 2018년 TaeMin Bang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var tf: UITextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// tf에 이벤트가 발생시 현재 클래스에서 메소드를 찾아서 실행
		tf.delegate = self
	}

	// ViewController 기능 확장
	extension ViewController : UITextFieldDelegate{
		func textFieldShouldReturn(_ textField: UITextField) -> Bool{
			print("Return Key Click")
			return true
		}
}

