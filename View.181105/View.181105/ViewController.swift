//
//  ViewController.swift
//  View.181105
//
//  Created by 503-18 on 2018. 11. 5..
//  Copyright © 2018년 TaeMin Bang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	// 이미지 뷰에 출력할 UIImage 배열 : 인스턴스를 생성해서 대입
	var imgArray = [UIImage]()
	
	// 현재 출력 중인 이미지의 인덱스를 저장할 변수, ?가 붙으면 nil을 저장할 수 있는 Optional 자료형
	var i : Int?
	
	// 애니메이션 속도를 저장할 변수
	var speed : Float?
	
	@IBOutlet weak var lblPage: UILabel!
	@IBOutlet weak var slider: UISlider!
	@IBOutlet weak var imgView: UIImageView!
	
	@IBAction func changeSpeed(_ sender: Any) {
		
		// 변화된 슬라이더의 값을 speed에 저장
		speed = slider.value
		
		// 애니메이션 중일 때는 애니메이션을 멈추고 값을 적용한 다음에 다시 시작
		if imgView.isAnimating{
			imgView.stopAnimating()
			imgView.animationDuration = TimeInterval(speed!)
			imgView.startAnimating()
		}
	}
	
	@IBAction func next(_ sender: Any) {
	
		i = i! + 1
		if i! > imgArray.count - 1{
			i = 0
		}
		imgView.image = imgArray[i!]
		lblPage.text = "\(i!+1)/\(imgArray.count)"
	}
	
	@IBAction func play(_ sender: Any) {
		if imgView.isAnimating == true{
			imgView.stopAnimating()
			(sender as! UIButton).setTitle("시작", for: .normal)
		}else{
			// 애니메이션 시간 설정
			imgView.animationDuration = TimeInterval(speed!)
			
			// 애니메이션 시작
			imgView.startAnimating()
			
			// 이벤트가 발생한 인스턴스의 타이틀 변경
			(sender as! UIButton).setTitle("중지", for: .normal)
		}
	}
	
	@IBAction func prev(_ sender: Any) {
		// 이미지의 인덱스에 1을 감소시켜서 출력, 인덱스는 0보다 작을 수 없으므로, 0보다 작은 경우는 가장 마지막 번호로 변경
		i = i! - 1
		if i! < 0{
			i = imgArray.count - 1
		}
		imgView.image = imgArray[i!]
		lblPage.text = "\(i!+1)/\(imgArray.count)"
	}

	override func viewDidLoad() {
		// 이미지 배열에 데이터 추가, 파일 이름이 일련번호가 포함된 형태이면 반복문으로 추가 가능
		for x in 1...5{
			//nil을 리턴할 가능성이 있는 메소드를 호출한 경우에는 그 결과를 저장할 Optional로 만들어주어야하므로 변수의 자료형 뒤에 !를 붙여주어야 한다.
			let image : UIImage! = UIImage(named: "image\(x).png")
			imgArray.append(image)
		}
		
		// 이미지 뷰에 애니메이션으로 사용할 이미지 배열 설정
		imgView.animationImages = imgArray
		
		// i의 초기값 설정
		i = 0
		
		// 애니메이션 속도도 초기화
		speed = 0.5
		
		// 초기 이미지 설정
		imgView.image = imgArray[0]
	}
}

