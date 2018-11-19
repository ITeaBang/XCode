//
//  ViewController.swift
//  WebData.181116
//
//  Created by 503-18 on 2018. 11. 16..
//  Copyright © 2018년 TaeMin Bang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var imgView: UIImageView!
	override func viewDidLoad() {
		super.viewDidLoad()
		// 문자열을 가져올 URL 생성
		let url = URL (string: "https://www.daum.net/")
		// 데이터 가져오기 (예외처리를 원하지 않을 경우:try! 사용)
		let data = try! Data(contentsOf: url!)
		// 콘솔에 출력
		// print(data)
		// 문자열로 변환해서 출력
		let daumString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
		print(daumString!)
		
		// 파일 매니저 객체 생성
		let fm = FileManager.default
		// 도큐먼트 디렉토리 경로를 생성
		let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
		let docDir = dirPaths[0]
		// 파일 경로 생성
		let filePath = docDir + "/joy.jpg"
		// 파일이 없을 경우
		if fm.fileExists(atPath: filePath) == false{
			// 이미지 파일의 내용을 다운로드 받기
			let addr = "http://attach.s.op.gg/forum/20171128225938_920914.png"
			let imageUrl = URL (string: addr)
			let imageData = try! Data(contentsOf: imageUrl!)
			// 다운로드 받은 데이터로 파일 생성
			fm.createFile(atPath: filePath, contents: imageData, attributes: nil)
			print("다운로드")
		}
		let dataBuffer = fm.contents(atPath: filePath)
		// 이미지 데이터로 변환
		let image = UIImage(data: dataBuffer!)
		// 화면에 출력
		imgView.image = image
	}
}

