//
//  ViewController.swift
//  GestureTest
//
//  Created by 503-18 on 2018. 11. 6..
//  Copyright © 2018년 TaeMin Bang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	// Tap 동작이 발생했을 때 수행할 메소드
	@objc func tapMethod(sender:UITapGestureRecognizer){
		print("Double Click")
	}
	
	@IBOutlet weak var imageVIew: UIImageView!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Tap 제스쳐 만들기
		let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(tapMethod(sender:)))
		
		// 제약조건 설정
		tapGesture.numberOfTapsRequired = 2
		
		// 뷰와 제스쳐 연결
		imageVIew.addGestureRecognizer(tapGesture)
		
	}
}
