//
//  ViewController.swift
//  TableViewTest
//
//  Created by 503-18 on 2018. 11. 9..
//  Copyright © 2018년 TaeMin Bang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	
	// 테이블 뷰에 출력할 데이터의 배열 선언
	var names : [String] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		names.append("Programming Language")
		names.append("Data Structure")
		names.append("Algorithm")
		names.append("DataBase")
		names.append("S/W Engineering")
		names.append("Computer Structure")
		names.append("Operating System")
	
	// 테이블 뷰의 delegate, dataSource 지정
	tableView.delegate = self
	tableView.dataSource = self
	}
}

// 테이블 뷰 관련 메소드
extension ViewController : UITableViewDelegate, UITableViewDataSource{
	// 섹션별 행의 개수를 리턴하는 메소드
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return names.count
	}
	
	// 셀을 생성해주는 메소드
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
		
		// 재사용 가능한 셀을 가져오기
		var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
		
		// 재사용 가능한 셀이 없으면 셀을 새로 생성
		if cell == nil { cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")}
		
		// 셀의 레이블에 names 배열의 데이터를 출력
		cell?.textLabel!.text = names[indexPath.row]
		return cell!
	}
}

