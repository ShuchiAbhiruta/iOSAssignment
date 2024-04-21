//
//  GridViewModel.swift
//  iOSAssignment
//
//  Created by Shuchi Abhiruta on 18/04/24.
//

import Foundation
import SwiftUI

final class GridViewModel:ObservableObject{
    let columns = Array(repeating: GridItem(.flexible()), count: 3)
    @Published var imageList:[ImageDataResponse] = []
    @Published var alertItem:AlertItem?
    @Published var isLoading:Bool = false
    
    
    func getImageResources(){
        isLoading = true
        NetworkManager.shared.getImageData { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result{
                case .success(let imageList):
                    self.imageList = imageList
    
                case .failure(let error):
                    print(error.localizedDescription)
                    switch error{
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToCompleted
                    }
                }
            }
        }
    }
    
}
