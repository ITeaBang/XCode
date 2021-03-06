//
//  ViewController.swift
//  Map.181122
//
//  Created by 503-18 on 2018. 11. 22..
//  Copyright © 2018년 TaeMin Bang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	// 출력할 이미지 파일의 이름을 저장할 배열
	var imageNames = [String]()
	
	@IBOutlet weak var collectionView: UICollectionView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// 배열에 데이터 저장(fruit1.jpg ~ fruit8.jpg)
		for i in 1 ... 8 {
			imageNames.append("fruit\(i).jpg")
		}
		
		// 컬렉션 뷰의 출력과 이벤트 핸들링을 담당할 인스턴스 지정
		collectionView.delegate = self
		collectionView.dataSource = self
	}
}

// Mark: collectionView의 delegate, dataSource
extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource{
	
	// 출력할 데이터 개수를 설정하는 메소드
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
		return imageNames.count
	}
	
	// 출력할 셀을 만들어주는 메소드
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
		// 이미지 출력 설정
		cell.imgView.image = UIImage(named: imageNames[indexPath.row])
		return cell
	}
}
