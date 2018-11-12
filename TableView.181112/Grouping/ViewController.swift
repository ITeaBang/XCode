//
//  ViewController.swift
//  Grouping
//
//  Created by 503-18 on 2018. 11. 12..
//  Copyright © 2018년 TaeMin Bang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	
	// 출력할 문자열을 저장할 변수
	var data : Array<String> = []
	
	// 분류할 데이터들을 저장할 변수
	var sectionData : Array<Dictionary<String,Any>> = []
	
	// 분류할 때 사용할 한글 자음 배열
	var indexes : Array<String> = []
	
	// 문자열을 매개변수로 받아서 첫글자의 자음을 리턴하는 메소드
	func subtract(data : String) -> String{
		var result = data.compare("나")
		if result == ComparisonResult.orderedAscending{
			return "ㄱ"
		}
		result = data.compare("다")
		if result == ComparisonResult.orderedAscending{
			return "ㄴ"
		}
		result = data.compare("리")
		if result == ComparisonResult.orderedAscending{
			return "ㄷ"
		}
		result = data.compare("마")
		if result == ComparisonResult.orderedAscending{
			return "ㄹ"
		}
		result = data.compare("바")
		if result == ComparisonResult.orderedAscending{
			return "ㅁ"
		}
		result = data.compare("사")
		if result == ComparisonResult.orderedAscending{
			return "ㅂ"
		}
		result = data.compare("아")
		if result == ComparisonResult.orderedAscending{
			return "ㅅ"
		}
		result = data.compare("자")
		if result == ComparisonResult.orderedAscending{
			return "ㅇ"
		}
		result = data.compare("차")
		if result == ComparisonResult.orderedAscending{
			return "ㅈ"
		}
		result = data.compare("카")
		if result == ComparisonResult.orderedAscending{
			return "ㅊ"
		}
		result = data.compare("타")
		if result == ComparisonResult.orderedAscending{
			return "ㅋ"
		}
		result = data.compare("파")
		if result == ComparisonResult.orderedAscending{
			return "ㅌ"
		}
		result = data.compare("하")
		if result == ComparisonResult.orderedAscending{
			return "ㅍ"
		}
		return "ㅎ"
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()

		tableView.delegate = self
		tableView.dataSource = self
		
		data = ["반바스텐", "루드글리트", "리카르트", "베르캄프", "앙리", "지단", "음바페", "호나우두", "메시", "기린샤", "마라도나", "캠페스", "바티스투타", "시어러", "뮐러", "차범근", "김주성", "최용수", "윤정환", "허정무", "웨아", "바조", "제라드"]
		
		indexes = ["ㄱ","ㄴ","ㄷ","ㄹ","ㅁ","ㅂ","ㅅ","ㅇ","ㅈ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"]
		
		// 분류하기 (데이터를 분류하기 위한 배열 생성)
		var temp : [[String]] = Array(repeating: Array(), count: indexes.count)
		
		var i = 0
		while i < indexes.count {
			// 한글 자음 가져오기
			let firstName = indexes[i]
			var j = 0
			while j < data.count{
				// 이름 가져오기
				let str = data[j]
				// 이름의 첫 자음과 동일한 자음을 만나면 그 때의 인덱스에 해당하는 배열에 저장
				if firstName == subtract(data: str){
					temp[i].append(str)
				}
				j = j + 1
			}
			i = i + 1
		}
		
		// 각 배열의 데이터를 오름차순 정렬
		i = 0
		while i < temp.count{
			// 데이터를 2개 이상 소유한 배열만 오름차순 정렬
			var imsi = temp[i]
			if imsi.count >= 2{
				imsi.sort()
			}
			i = i + 1
		}
		
		// 분류된 데이터를 자음과 함께 디셔너리에 저장해서 디셔너리 배열에 추가
		i = 0
		while i < indexes.count {
			if temp[i].count > 0{
				var dic : Dictionary<String, Any> = [:]
				
				// 한글 자음 저장
				dic["section_name"] = indexes[i]
				
				// 데이터 저장
				dic["data"] = temp[i]
				sectionData.append(dic)
			}
			i = i + 1
		}
	}
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
	
	// 그룹의 개수를 설정하는 메소드
	func numberOfSections(in tableView: UITableView) -> Int{
		return sectionData.count
	}
	
	// 그룹의 타이틀을 설정하는 메소드
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
		// 그룹 번호에 해당하는 데이터를 찾아오기
		let dic = sectionData[section]
		// 데이터가 Any로 설정되어 있어서 꺼낸 후 강제 형변환을 통해서 원래의 자료형으로 되돌리는 작업
		let title = (dic["section_name"] as! NSString) as String
		return title
	}
	
	// 섹션별 행의 개수를 설정하는 메소드
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// 그룹 번호에 해당하는 데이터를 찾아오기
		let dic = sectionData[section]
		// 각 자음에 해당하는 배열을 꺼내서 행의 개수를 설정
		let ar = (dic["data"] as! NSArray) as Array
		return ar.count
	}
	
	// 셀을 만들어주는 메소드
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		// 재사용 가능한 셀 가져오기
		var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
		if cell == nil{
			cell = UITableViewCell.init(style: .default, reuseIdentifier: "Cell")
		}
		// 출력할 데이터 찾아오기
		var dic = sectionData[indexPath.section]
		var ar = (dic["data"] as! NSArray) as Array
		cell?.textLabel?.text = (ar[indexPath.row] as! NSString) as String
		return cell!
	}
	
	// 테이블 뷰 오른쪽에 인덱스를 만들어주는 메소드
	func sectionIndexTitles(for tableView: UITableView) -> [String]?{
		return indexes
	}
	
	// 인덱스를 눌렀을 때 화면에 보여질 섹션 번호를 설정하는 메소드
	func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
		// 누른 문자열과 동일한 그룹 이름을 검색해서 동일한 그룹으로 화면 이동
		var i = 0
		while i < sectionData.count{
			var dic = sectionData[i]
			let sectionName = (dic["section_name"] as! NSString) as String
			if sectionName == title{
				return i
			}
			i = i + 1
		}
		return -1
	}
}
