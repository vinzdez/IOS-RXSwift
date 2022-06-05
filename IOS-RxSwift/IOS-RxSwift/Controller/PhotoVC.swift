//
//  PhotoVC.swift
//  IOS-RxSwift
//
//  Created by Vicente Angcaway on 6/4/22.
//

import Foundation

import RxSwift
import RxCocoa

class PhotoVC : UIViewController  {
	
	@IBOutlet var photoTableView: UITableView!
	
	private let disposeBag = DisposeBag()
	var photoVm = PhotoViewModel()
	var photoList = BehaviorRelay<[PhotoModel]>(value:[])
	
	var activityIndicator: UIActivityIndicatorView!
	var viewActivityIndicator: UIView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.setupBinding()
		//call api
		self.photoVm.getPhotos()
	}
	
	private func setupBinding(){
		
		//PhotoCell
		self.photoTableView.register(UINib(nibName: "photoCell", bundle: nil), forCellReuseIdentifier: String(describing: PhotoCell.self))
		//bind photolist to VC
		self.photoVm
			.photoList
			.observe(on: MainScheduler.instance)
			.bind(to: photoList).disposed(by: disposeBag)
		
		self.photoList.bind(to: photoTableView.rx.items(cellIdentifier: "PhotoCell", cellType: PhotoCell.self)){
			(row,photo,cell) in
			cell.cellPhoto = photo
		}.disposed(by: disposeBag)
		
		self.photoTableView.rx.itemSelected.subscribe(onNext: {[weak self] indexPath in
			let cell = self?.photoTableView.cellForRow(at: indexPath) as? PhotoCell
			let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
			let photoDetail = storyBoard.instantiateViewController(withIdentifier: "photoDetailVC") as! PhotoDetailVC
			photoDetail.photoImg.accept((cell?.cellPhoto.url)!)
			photoDetail.photoTitle.accept((cell?.cellPhoto.title)!)
			self?.navigationController?.pushViewController(photoDetail, animated: false)
			
		}).disposed(by: disposeBag)
	
	}
	
	
}
