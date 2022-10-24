//
//  TestView.swift
//  BM
//
//  Created by NikitaSergeevich on 10/08/2022.
//

import SwiftUI

enum TestedViews: String {
    case allUsers
    case createdUser
}

struct TestView: View {
    @ObservedObject var viewModel: TestViewModel
   
    
    var body: some View {
        HStack {
            Button {
                viewModel.number -= 1
            } label: {
                Image(systemName: "minus")
            }
            Text("\(viewModel.number)")
            Button {
                viewModel.number += 1
            } label: {
                Image(systemName: "plus")
            }
        }
    }
    
}

//struct TestView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestView()
//    }
//}
