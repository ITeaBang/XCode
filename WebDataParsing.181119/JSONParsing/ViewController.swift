//
//  ViewController.swift
//  JSONParsing
//
//  Created by 503-18 on 2018. 11. 19..
//  Copyright © 2018년 TaeMin Bang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	
	// 저자 이름과 제목을 저장할 배열
	var titles : [String] = [String]()
	var authors : [String] = [String]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// 데이터를 다운로드 받을 URL 생성
		let url = URL(string:"https://apis.daum.net/search/book?apikey=465b06fae32febacbc59502598dd7685&q=java&output=json")
		// 웹의 데이터를 다운로드
		let data = try! Data(contentsOf: url!)
		// 다운로드받은 데이터가 JSON 형식이라면 Parsing해서 Dictionary로 변환
		let result = try! JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
		// channel 키의 값을 Dictionary로 가져오기
		let channel = result["channel"] as! NSDictionary
		// item 키의 값을 배열로 가져오기
		let items = channel["item"] as! NSArray
		// 배열은 반드시 반복문으로 순회
		for index in 0...(items.count-1){
			// 데이터 가져오기
			let item = items[index] as! NSDictionary
			titles.append(item["title"] as! String)
			authors.append(item["author"] as! String)
		}
		
		tableView.dataSource = self
	}
}
// 기능 확장 - extension
extension ViewController : UITableViewDataSource{

	// 행의 개수를 설정하는 메소드
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
		return titles.count;
	}
	
	// 셀을 만들어주는 메소드
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
		// 셀 생성
		let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
		// 셀의 내용을 출력
		cell.textLabel?.text = "\(authors[indexPath.row]) - \(titles[indexPath.row])"
		return cell
	}
}
