//
//  LoadingView.swift
//  iOSAssignment
//
//  Created by Shuchi Abhiruta on 21/04/24.
//

import SwiftUI

struct ActivityIndicator:UIViewRepresentable{
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = .gray
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
}

struct LoadingView:View {
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            ActivityIndicator()
        }
    }
}
#Preview {
    LoadingView()
}
