//
//  ViewController.swift
//  ViewController.181106
//
//  Created by 503-18 on 2018. 11. 6..
//  Copyright © 2018년 TaeMin Bang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	var selectedRow = 0
	@IBOutlet weak var pickerView: UIPickerView!
	
	// pickerView에 출력할 데이터 배열
	var ar : [String] = [String]()
	
	// 메인 데이터와 서브 데이터를 저장할 변수
	var mainData : [String] = [String]()
	var subData : [[String]] = [[String]]()
	
	@IBAction func click(_ sender: Any) {
		// pickerView에서 선택된 행 번호 찾아오기, 열 번호에 해당하는 선택된 행 번호를 저장
		let row = pickerView.selectedRow(inComponent: 0)
		let subRow = pickerView.selectedRow(inComponent: 1)
		print(mainData[row] + ":" + subData[row][subRow])
	}


override func viewDidLoad() {
	super.viewDidLoad()
	
	// 배열에 데이터 추가
	ar.append("마르코 반바스텐")
	ar.append("루드 굴리트")
	ar.append("조지 웨아")
	ar.append("요한 크루이프")
	
	// 배열에 데이터 추가
	mainData.append("프로그래밍언어")
	mainData.append("데이터베이스")
	
	// 배열에 데이터 추가
	subData.append(["Java", "Python", "Kotlin", "Swift", "C++", "C#", "C", "JavaScript"])
	subData.append(["Oracle", "MySQL", "MSSQL", "SQLite", "Access"])
	
	// pickerView의 delegate, dataSource 설정
	pickerView.delegate = self
	pickerView.dataSource = self
}
}
// pickerView 출력을 위한 extension
extension ViewController : UIPickerViewDataSource, UIPickerViewDelegate{
	
	// 열의 개수를 설정하는 메소드
	func numberOfComponents(in pickerView: UIPickerView) -> Int{return 2}
	
	// 열별로 행의 개수를 설정하는 메소드
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
		if component == 0{
			return mainData.count
		}else{
			return subData[selectedRow].count
		}
	}
	
	// pickerView에 출력할 문자열을 설정하는 메소드
	// return하는 문자열이 pickerView에 출력
	// row : 행 번호, component : 열 번호
	func pickerView(_ pickerView: UIPickerView,  titleForRow row: Int, forComponent component: Int) -> String?{
		// 배열에서 행 번호에 해당하는 데이터 리턴
		// return ar[row]
		if component == 0{
			return mainData[row]
		}else {
			return subData[selectedRow][row]
		}
	}
	
	// pickerView의 선택이 변경되었을 때 호출되는 메소드
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
		// 첫번째 열의 선택이 변경시
		if component == 0 {
			// 선택된 행 번호를 selectedRow에 대입
			selectedRow = pickerView.selectedRow(inComponent: 0)
			// pickerView의 두번째 열의 데이터를 재출력
			pickerView.reloadComponent(1)
		}
	}
}


