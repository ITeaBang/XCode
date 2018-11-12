//
//  DetailViewController.swift
//  Transition.181109
//
//  Created by 503-18 on 2018. 11. 9..
//  Copyright © 2018년 TaeMin Bang. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

	@IBOutlet weak var detailDescriptionLabel: UILabel!
	@IBOutlet weak var webView: WKWebView!
	
	// MasterViewController로부터 데이터를 넘겨받을 변수
	var addr : String?
	
	// MasterViewController에서 테이블의 항목을 선택하면 호출되는 메소드
	func configureView() {
		// addr이 없을 경우 더조은 홈페이지 출력
		if addr == nil { addr = "http://tjoeun.co.kr" }
	// 문자열로 된 주소를 URL로 변환해서 웹 뷰에 출력
	let url = URL(string:addr!)
	let request = URLRequest(url:url!)
	webView.load(request)
	} 

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		configureView()
	}

	var detailItem: NSDate? {
		didSet {
		    // Update the view.
		    configureView()
		}
	}
}
