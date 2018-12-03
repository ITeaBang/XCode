//
//  ViewController.swift
//  MapDisplay
//
//  Created by 503-18 on 2018. 11. 22..
//  Copyright © 2018년 TaeMin Bang. All rights reserved.
//

import UIKit
// 연락처
import Contacts
// 지도
import MapKit
// 위치정보
import CoreLocation

class ViewController: UIViewController {

	@IBOutlet weak var zip: UITextField!
	@IBOutlet weak var state: UITextField!
	@IBOutlet weak var city: UITextField!
	@IBOutlet weak var street: UITextField!

	// 주소에 해당하는 위도, 경도를 저장할 변수 선언
	var coords : CLLocationCoordinate2D?
	
	// 지도를 출력하는 사용자 정의 메소드
	func showMap(){
		// 입력한 내용 가져오기
		if
		let addressString = street.text, let cityString = city.text, let stateString = state.text, let zipString = zip.text, let coordinate = coords{
		// 주소 객체 만들기
		let addressDict = [CNPostalAddressStreetKey:addressString, CNPostalAddressCityKey:cityString, CNPostalAddressStateKey:stateString, CNPostalAddressPostalCodeKey:zipString]
		// 지도를 출력할 장소 만들기
		let place = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
		// 지도에 출력할 장소를 포함할 객체 생성
		var mapItem = MKMapItem(placemark: place)
			// 지도 옵션 설정
			let options = [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving]
			// 지도 출력
			mapItem.openInMaps(launchOptions: options)
		}
	}
	
	@IBAction func displayMap(_ sender: Any) {
		
		// 역 지오코딩 : 주소정보를 이용해서 위치정보를 찾아오는 것
		// 다음, 네이버의, 구글 오픈 API나 애플의 경우는 MapKit에서 기능을 제공
		// 안드로이드의 경우 API 필수
		// 주소는 거리 - 도시 - 주 - 우편번호 순서
		if let addressString = street.text, let cityString = city.text, let stateString = state.text, let zipString = zip.text{
			let address = "\(addressString) \(cityString) \(stateString) \(zipString)"
			// 위도, 경도 찾아오기
			CLGeocoder().geocodeAddressString(address, completionHandler:{(placemarks, error) in
				// 에러가 발생한 경우 (인터넷 연결 문제, 주소 오류)
				if error != nil{
					print("Fail : \(error!.localizedDescription)")
				}else if let marks = placemarks, marks.count>0{
					// 첫 번째 데이터 가져오기
					// 주소를 가지고 위도, 경도를 찾을 다양한 경우의 수
					let placemark = marks[0]
					// 주소를 저장하고 지도를 출력하는 메소드 호출
					if let location = placemark.location
					{
						self.coords = location.coordinate
						self.showMap()
					}
				}
			})
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
}
