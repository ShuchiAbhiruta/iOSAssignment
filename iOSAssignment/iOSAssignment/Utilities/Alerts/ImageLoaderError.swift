//
//  ImageLoaderError.swift
//  iOSAssignment
//
//  Created by Shuchi Abhiruta on 21/04/24.
//

import Foundation


enum ImageLoaderError:Error{
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
