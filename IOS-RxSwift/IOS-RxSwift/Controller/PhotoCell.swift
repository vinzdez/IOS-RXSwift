//
//  PhotoCell.swift
//  IOS-RxSwift
//
//  Created by Vicente Angcaway on 6/4/22.
//

import UIKit
import Kingfisher

class PhotoCell : UITableViewCell{
	
	//@IBOutlet weak var photoIdLbl: UILabel!
	@IBOutlet weak var photoLbl: UILabel!
	@IBOutlet weak var imgPhoto: UIImageView!
	//@IBOutlet weak var photoIdView: UIView!
	
	var cellPhoto : PhotoModel! {
		didSet{
			self.photoLbl.text = cellPhoto.title
			//self.photoIdLbl.text = String(cellPhoto.id)
			//self.photoIdView.clipsToBounds = true
			//self.photoIdView.layer.cornerRadius = 4
			let url = URL(string:cellPhoto.thumbnailUrl)
			self.imgPhoto.kf.setImage(with: url)
		}
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	
}
