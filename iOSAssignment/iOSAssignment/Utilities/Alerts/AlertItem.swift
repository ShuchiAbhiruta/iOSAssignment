//
//  AlertItem.swift
//  iOSAssignment
//
//  Created by Shuchi Abhiruta on 21/04/24.
//

import SwiftUI

struct AlertItem:Identifiable{
    let id = UUID()
    let title:Text
    let message:Text
    let dismissButton:Alert.Button
}

struct AlertContext{
    static let invalidData      = AlertItem(title: Text("Server Error"), message: Text("The data received from the server, Please contact support"), dismissButton: .default(Text("OK")))
    
    static let invalidResponse  = AlertItem(title: Text("Server Error"), message: Text("Invalid response from server. Please try again later or contact support"), dismissButton: .default(Text("OK")))
    
    static let invalidURL       = AlertItem(title: Text("Server Error"), message: Text("There was an issue conntecting to server.If this persist, Please connect support"), dismissButton: .default(Text("OK")))
    
    static let unableToCompleted = AlertItem(title: Text("Server Error"), message: Text("Unable to complete your request at this time. Please check your network connection."), dismissButton: .default(Text("OK")))
}
