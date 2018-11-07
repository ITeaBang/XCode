//
//  ViewController.swift
//  LoginDialog
//
//  Created by 503-18 on 2018. 11. 7..
//  Copyright © 2018년 TaeMin Bang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	//화면에 뷰가 보여질 때 보여지는 메소드
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		let appDelegate = UIApplication.shared.delegate as! AppDelegate
		if appDelegate.session == nil{
			print("비로그인 상태입니다.")
		}else{
			print("\(appDelegate.session!)님이 로그인 하셨습니다.")
		}
	}
	
	@IBOutlet weak var result: UILabel!
	@IBAction func login(_ sender: Any) {
	
		// 자신의 App에 있는 appDelegate 클래스의 객체에 접근
		let appDelegate = UIApplication.shared.delegate as! AppDelegate
		
		// 공유 변수를 nil로 설정
		appDelegate.session = nil
		
		// 대화 상자를 생성
		let loginDialog = UIAlertController.init(title: nil, message: "로그인", preferredStyle: .alert)
		
		// TextField 추가 : handler는 TextField의 모양 설정
		loginDialog.addTextField(configurationHandler:{
			(tf) in tf.placeholder = "아이디릅 입력하세요"
			tf.isSecureTextEntry = false
		})
		
		loginDialog.addTextField(configurationHandler:{
			(tf) in tf.placeholder = "비밀번호를 입력하세요"
			tf.isSecureTextEntry = true
		})
		
		let cancel = UIAlertAction.init(title: "취소", style: .cancel)
		let ok = UIAlertAction.init(title: "확인", style: .default){
			(btn) in
			
			// 첫번째 TextField와 두번째 TextField의 입력 내용 가져오기
			let loginid = loginDialog.textFields?[0].text
			let loginpw = loginDialog.textFields?[1].text
			
			// id와 pw를 비교해서 로그인 여부 결정
			if loginid == "root" && loginpw == "1234"{
				self.result.text = "로그인에 성공하셨습니다."
				
				// 자신의 App에 있는 AppDelegate 클래스의 객체에 접근
				let appDelegate = UIApplication.shared.delegate as! AppDelegate
				
				// 공유 변수를 nil로 설정
				appDelegate.session = loginid
			
			}else{
				self.result.text = "없는 아이디이거나 비밀번호가 잘못되었습니다."
			}
		}
		
		// Button을 대화 상자에 부착
		loginDialog.addAction(cancel)
		loginDialog.addAction(ok)
		
		// 화면에 출력
		self.present(loginDialog, animated: true)
	} 
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}
}

