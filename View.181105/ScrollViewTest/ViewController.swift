import UIKit

extension ViewController : UIScrollViewDelegate{
	
	// Zoom이 실행될 View를 지정하는 메소드, Return하는 View에서 Zoom 구현
	func viewForZooming(in scrollView: UIScrollView) -> UIView? {
		return imageView
	}
}

class ViewController: UIViewController {
	
	// imageView 변수 생성 - nil을 저장 가능하도록 생성
	// !를 추가해서 생성하므로 사용시 !의 추가가 불필요
	var imageView : UIImageView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// imageView에 출력할 Image 생성
		let image = UIImage(named: "지효.jpg")
		
		// 이미지를 이용해서 ImageView 생성
		imageView = UIImageView(image : image!)
		
		// 이미지 크기를 가져오기
		let imageSize = imageView.frame.size
		
		// scrollView를 전체 크기로 생성
		let scrollView = UIScrollView(frame:UIScreen.main.bounds)
		
		// imageView가 Scroll이 가능하도록 설정 ( Touch 사용 가능 여부 설정 )
		imageView.isUserInteractionEnabled = true
		
		// scrollView가 Scroll이 가능하도록 설정
		scrollView.isScrollEnabled = true
		
		// scrollView의 화면 크기 설정
		scrollView.contentSize = imageSize
		
		// scrollView 위에 imageView 추가
		scrollView.addSubview(imageView)
		
		// scrollView를 영역 밖으로 Scroll 할 수 없도록 속성 설정
		scrollView.bounces = false
		
		// 현재 View Controller의 View에 추가
		self.view.addSubview(scrollView)
		
		scrollView.maximumZoomScale = 2.0
		scrollView.minimumZoomScale = 0.5
		
		// scrollView의 delegate 설정
		scrollView.delegate = self
		
	}
	
}
