//
//  ViewController.swift
//  TextFieldTest.181102
//
//  Created by 503-18 on 2018. 11. 2..
//  Copyright © 2018년 TaeMin Bang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var lblDisplay: UILabel!
	@IBOutlet weak var txtName: UITextField!
	@IBOutlet weak var txtAge: UITextField!

	// txtName에서 return을 눌렀을 경우
	@IBAction func move(_ sender: Any) {
		txtAge.becomeFirstResponder()
	}
	
	// txtAge에서 return을 눌렀을 경우
	@IBAction func hide(_ sender: Any) {
		txtAge.resignFirstResponder()
	}
	
	// Click Button을 눌렀을 경우
	@IBAction func click(_ sender: Any) {
		let name = txtName.text
		let age = txtAge.text
		
		// !를 붙이지 않으면 Optional이 같이 출력
		let msg = "(\(name!) , \(age!))"
		
		lblDisplay.text = msg
	}
	
	// Window 화면을 터치한 경우
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		txtName.resignFirstResponder()
		txtAge.resignFirstResponder()
	}
	
	// 처음 프로그램을 시작했을 경우
	override func viewDidLoad() {
		super.viewDidLoad()
		// 텍스트 필드를 FirstResponder로 설정, 키보드가 화면에 출력
		txtName.becomeFirstResponder()
	}
}
