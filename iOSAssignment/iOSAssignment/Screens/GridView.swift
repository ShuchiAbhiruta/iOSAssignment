//
//  ContentView.swift
//  iOSAssignment
//
//  Created by Shuchi Abhiruta on 18/04/24.
//

import SwiftUI

struct GridView: View {
    @StateObject var viewModel = GridViewModel()
    var body: some View {
        ZStack{
            ZStack{
                if viewModel.imageList.isEmpty{
                    Color(.systemBackground)
                        .edgesIgnoringSafeArea(.all)
                }else{
                    Color.pink.opacity(0.5)
                        .ignoresSafeArea()
                }
                if !viewModel.imageList.isEmpty{
                    ImageGridView(viewModel: viewModel)
                }
               
            }.onAppear{
                if viewModel.imageList.isEmpty{
                    viewModel.getImageResources()
                }
            }
            if viewModel.isLoading{
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem){alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
    
}


struct ImageGridView: View {
    @ObservedObject var viewModel : GridViewModel
    var body: some View {
        ScrollView(.vertical){
            LazyVGrid(columns: viewModel.columns){
                ForEach(viewModel.imageList) { imageData in
                    GridCellView(imageData: imageData)
                }
            }
        }.padding()
    }
}


#Preview {
    GridView()
}
