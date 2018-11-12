//
//  ViewController.swift
//  TableView.181112
//
//  Created by 503-18 on 2018. 11. 12..
//  Copyright © 2018년 TaeMin Bang. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
	
	// 데이터 배열
	var ar : [Dictionary<String, String>] = []
	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let dic1 = ["name":"제시카", "skill":"영어", "imageName":"image1.png"]
		let dic2 = ["name":"유리", "skill":"중국어", "imageName":"image2.png"]
		let dic3 = ["name":"태연", "skill":"중국어", "imageName":"image3.png"]
		let dic4 = ["name":"윤아", "skill":"댄스", "imageName":"image4.png"]
		let dic5 = ["name":"티파니", "skill":"영어, 플롯", "imageName":"image5.png"]

		ar.append(dic1)
		ar.append(dic2)
		ar.append(dic3)
		ar.append(dic4)
		ar.append(dic5)

		// 테이블 뷰의 delegate와 dataSource 설정
		tableView.delegate = self
		tableView.dataSource = self
	}
}

// ViewController의 기능확장
extension ViewController : UITableViewDelegate, UITableViewDataSource{
	// 행의 개수를 설정하는 메소드
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return ar.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? CustomCell
		
		// 데이터 찾아오기
		var dic = ar[indexPath.row]
		// 찾아온 데이터를 출력
		cell!.lblName.text = dic["name"]
		cell!.lblSkill.text = dic["skill"]
		cell!.imgView.image = UIImage(named: dic["imageName"]!)
		return cell!
	}
	
	// 셀의 높이를 설정하는 메소드
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 80
	}
}
