//
//  PhotoViewModel.swift
//  IOS-RxSwift
//
//  Created by Vicente Angcaway on 6/4/22.
//

import Foundation
import RxSwift
import RxCocoa


class PhotoViewModel{
		
	var photoList = BehaviorRelay<[PhotoModel]>(value:[])
	
	
	private let disposeBag = DisposeBag()
	
	func getPhotos(){
		requestData()
			.flatMap{$0.data == nil ? .empty() : Observable.just($0.data!)}
			.bind(to: photoList)
			.disposed(by: disposeBag)
	}
	
	
	
	
	public func requestData() -> Observable<RxResponse<[PhotoModel]>>{
		return BaseRxService<PhotoModel>.rxRequestWithArray(path: "https://jsonplaceholder.typicode.com/photos", method: .get, params: [:], headers: nil)
		
	}
	
}
