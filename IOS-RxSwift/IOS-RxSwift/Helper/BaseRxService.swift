//
//  BaseService.swift
//  IOS-RxSwift
//
//  Created by Vicente Angcaway on 6/4/22.
//

import Foundation
import ObjectMapper
import RxSwift
import Alamofire

enum APIError: Error {
  case network(error: NSError)
  case parse
}

struct RxResponse<T> {
  var data: T?
  var error: APIError?
  
  init(data: T?, error: APIError?) {
	self.data = data
	self.error = error
  }
}


struct BaseRxService<T> where T:Mappable{
	
  static func rxRequestWithArray(path:URLConvertible, method:HTTPMethod, params:Parameters, headers: HTTPHeaders? = nil) -> Observable<RxResponse<Array<T>>> {
	  
	  return Observable.create{ observer in
		  
		  let req =  AF.request(path , method: method)
			  .validate()
			  .responseJSON { response in
				switch response.result {
				case .success(let JSON):
					guard let response = JSON as? Array<[String: Any]> else {
						observer.onNext(RxResponse<Array<T>>(
							data: nil,
							error: .parse))
						observer.onError(APIError.parse)
						return
					}
				  
				  let data = response.compactMap { return T(JSON: $0) }
				  observer.onNext(RxResponse<Array<T>>(data: data, error: nil))
				  observer.onCompleted()
				case .failure(let error):
				  observer.onNext(RxResponse<Array<T>>(
					data: nil,
					error: .network(error: error as NSError)))
				  observer.onError(APIError.network(error: error as NSError))
				}
			}
		  
		  return Disposables.create {
			  req.cancel()
		  }
	  }
  }
}
