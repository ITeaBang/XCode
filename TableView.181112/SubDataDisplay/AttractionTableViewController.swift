//
//  AttractionTableViewController.swift
//  SubDataDisplay
//
//  Created by 503-18 on 2018. 11. 12..
//  Copyright © 2018년 TaeMin Bang. All rights reserved.
//

import UIKit

class AttractionTableViewController: UITableViewController {

	// 이미지 파일 이름을 저장할 배열
	var attractionImages = [String]()
	
	// 레이블에 출력할 텍스트 배열
	var attractionNames = [String]()

	// 하위 뷰 컨트롤러에 넘겨줄 URL 배열
	var attractionURLs = [String]()
	
    override func viewDidLoad() {
        super.viewDidLoad()

		self.title = "가보고 싶은 장소"
      	attractionNames = ["버킹험 궁전", "에펠탑", "그랜드캐년", "윈저궁", "엠파이어 스테이트 빌딩"]
		attractionURLs = ["http://en.wikipedia.org/wiki/Buckingham_Palace", "http://en.wikipedia.org/wiki/Eiffel_Tower", "http://en.wikipedia.org/wiki/Grand_Canyon", "http://en.wikipedia.org/wiki/Windsor_Castle", "http://en.wikipedia.org/wiki/Empire_State_Building"]
		attractionImages = ["buckingham_palace.jpg", "eiffel_tower.jpg", "grand_canyon.jpg", "windsor_castle.jpg", "empire_state_building.jpg"]
		
		// 테이블 뷰의 셀 높이 설정
		tableView.estimatedRowHeight = 70
    }
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
		return 100
	}
    // MARK: - Table view data source
	
	// 섹션(그룹)의 개수를 설정하는 메소드
    override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
    }

	// 섹션별 행의 개수를 설정해주는 메소드
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attractionImages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		// 셀 생성
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AttractionTableViewCell

		// 행번호에 해당하는 문자열 출력
		cell.attractionLabel.text = attractionNames[indexPath.row]
		
		// 이미지 출력
		cell.attractionImage.image = UIImage(named: attractionImages[indexPath.row])

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
