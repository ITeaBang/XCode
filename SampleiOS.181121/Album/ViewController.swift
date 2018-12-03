//
//  ViewController.swift
//  Album
//
//  Created by 503-18 on 2018. 11. 21..
//  Copyright © 2018년 TaeMin Bang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var imgView: UIImageView!
	
	@IBAction func pick(_ sender: Any) {
		// 앨범 출력
		let imagePicker = UIImagePickerController()
		imagePicker.allowsEditing = true
		// 미리 촬영한 이미지 가져오기 .camera(촬영)
		imagePicker.sourceType = .photoLibrary
		// delegate 메소드 위치 설정
		imagePicker.delegate = self
		// 화면 출력
		self.present(imagePicker, animated: true)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
}
	extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
		// 취소시 호출되는 메소드
		func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
			// 현재 창 닫기
			self.dismiss(animated: false){
				() in
				let alert = UIAlertController(title: "선택 취소", message: "사진 선택을 취소하셨습니다.", preferredStyle: .alert)
				alert.addAction(UIAlertAction(title: "확인", style: .cancel){ (alert) in})
				self.present(alert,animated: true)
			}
	}
		// 사진을 선택시 호출되는 메소드
		func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
			// completion이 나올 경우 : 지우고 아무것도 없을 경우, {() in }
			picker.dismiss(animated: true){() in
				// 선택한 이미지를 가져와서 imgView에 출력
				let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
				self.imgView.image = img
		}
	}
}
