//
//  PhotoModel.swift
//  IOS-RxSwift
//
//  Created by Vicente Angcaway on 6/4/22.
//

import Foundation
import ObjectMapper

struct PhotoModel : Mappable{
	
	var albumId : Int!
	var id : Int!
	var title : String!
	var url : String!
	var thumbnailUrl : String!
	
	init?(map: Map) {
		
	}
	
	mutating func mapping(map: Map) {
		albumId <- map["albumId"]
		id <- map["id"]
		title <- map["title"]
		url <- map["url"]
		thumbnailUrl <- map["thumbnailUrl"]
	}
	

}
