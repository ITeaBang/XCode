//
//  ViewController.swift
//  CellStyle
//
//  Created by 503-18 on 2018. 11. 9..
//  Copyright © 2018년 TaeMin Bang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	
	// 출력 데이터 배열
	var data : [VO] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.title = "국가"
		
		let vo1 = VO()
		vo1.nation = "한국"
		vo1.image = "korea.png"
		vo1.continent = "아시아"
		data.append(vo1)
		
		let vo2 = VO()
		vo2.nation = "영국"
		vo2.image = "Great Britain.png"
		vo2.continent = "유럽"
		data.append(vo2)
		
		let vo3 = VO()
		vo3.nation = "캐나다"
		vo3.image = "Canada.png"
		vo3.continent = "아메리카"
		data.append(vo3)
		
		let vo4 = VO()
		vo4.nation = "독일"
		vo4.image = "Germany.png"
		vo4.continent = "유럽"
		data.append(vo4)
		
		let vo5 = VO()
		vo5.nation = "미국"
		vo5.image = "America.png"
		vo5.continent = "아메리카"
		data.append(vo5)
		
	}
}

// 테이블 뷰 출력을 위한 extension
extension ViewController : UITableViewDataSource, UITableViewDelegate{
	
	// 셀을 클릭시 호출되는 메소드
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
		print(indexPath)
	}
	
	// 섹션별 행의 개수를 설정하는 메소드 - 필수
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
		return data.count
	}
	
	// 셀을 만들어주는 메소드
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
		
		// 재사용 가능한 셀이 있으면 그 셀을 이용
		var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
		
		// 재사용 가능한 셀이 없으면 새로 생성
		if cell == nil{
			cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "Cell")
		}
		
		// 배열에서 행번호에 해당하는 데이터 찾아오기
		let sub : VO = data[indexPath.row]
		
		// 데이터를 셀에 출력
		cell?.textLabel?.text = sub.nation
		cell?.detailTextLabel?.text = sub.continent
		cell?.imageView?.image = UIImage(named: sub.image)
		
		return cell!
	}
}
