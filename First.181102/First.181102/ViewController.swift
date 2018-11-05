//
//  ViewController.swift
//  First.181102
//
//  Created by 503-18 on 2018. 11. 2..
//  Copyright © 2018년 TaeMin Bang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	
	@IBOutlet weak var label: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	@IBAction func click(_ sender: Any) {
		print("Button Click")
	}
}

