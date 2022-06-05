//
//  PhotoDetailVC.swift
//  IOS-RxSwift
//
//  Created by Vicente Angcaway on 6/4/22.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

import Kingfisher

class PhotoDetailVC : UIViewController  {

	@IBOutlet weak var imgDetail: UIImageView!
	@IBOutlet weak var photoDetailLbl: UILabel!
	
	var photoTitle = BehaviorRelay<String>(value:"No Data Retrieve")
	var photoImg = BehaviorRelay<String>(value:"")
	
	override func viewDidLoad() {
		if #available(iOS 13.0, *) {
			self.modalPresentationStyle = .fullScreen
		}
		
		self.navigationItem.backBarButtonItem = UIBarButtonItem(
			title: "Back", style: .plain, target: nil, action: nil)
		let url = URL(string:photoImg.value)
		self.imgDetail.kf.setImage(with: url)
		self.photoDetailLbl.text = photoTitle.value
	}
	
}
