//
//  ImageDataResponse.swift
//  iOSAssignment
//
//  Created by Shuchi Abhiruta on 18/04/24.
//

import Foundation


struct ImageDataResponse:Decodable,Identifiable{
    let id: String
    let thumbnail:ImageResource
    
}

struct ImageResource:Decodable{

    let domain :String
    let basePath:String
    let key:String
    
    
}
