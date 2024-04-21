//
//  GridCellView.swift
//  iOSAssignment
//
//  Created by Shuchi Abhiruta on 19/04/24.
//

import SwiftUI

struct GridCellView: View {
    var imageData:ImageDataResponse
    
    var body: some View {
        ImageGridImage(urlString: "\(imageData.thumbnail.domain)/\(imageData.thumbnail.basePath)/0/\(imageData.thumbnail.key)")
            .aspectRatio(contentMode: .fit)
            .frame(width: 90,height: 90)
            .cornerRadius(5.0)
        
    }
}

#Preview {
    GridCellView(imageData: ImageDataResponse(id: "test", thumbnail: ImageResource.init(domain: "https://cimg.acharyaprashant.org", basePath: "images/img-86012d49-1120-4f08-a33e-c0519c19164e", key: "image.jpg")))
}
