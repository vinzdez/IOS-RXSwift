//
//  PhotoCell.swift
//  IOS-RxSwift
//
//  Created by Vicente Angcaway on 6/4/22.
//

import UIKit
import Kingfisher

class PhotoCell : UITableViewCell{
	
	@IBOutlet weak var photoLbl: UILabel!
	@IBOutlet weak var imgPhoto: UIImageView!
	@IBOutlet weak var photoIdBtn: UIButton!
	
	var cellPhoto : PhotoModel! {
		didSet{
			self.photoLbl.text = cellPhoto.title
			self.photoIdBtn.setTitle("ID:"+String(cellPhoto.id), for: .normal)
			let url = URL(string:cellPhoto.thumbnailUrl)
			self.imgPhoto.kf.setImage(with: url)
		}
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	
}
