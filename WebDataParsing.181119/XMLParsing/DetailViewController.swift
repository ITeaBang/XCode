//
//  DetailViewController.swift
//  XMLParsing
//
//  Created by 503-18 on 2018. 11. 19..
//  Copyright © 2018년 TaeMin Bang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

	
	@IBOutlet weak var txtSummary: UITextView!
	@IBOutlet weak var lblAuthor: UILabel!
	@IBOutlet weak var lblTitle: UILabel!
	
	var book : Book!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        lblTitle.text = book.title
		lblAuthor.text = book.author
		txtSummary.text = book.summary
		
		self.title = book.title
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
