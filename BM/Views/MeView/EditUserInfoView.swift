//
//  EditUserInformationView.swift
//  BM
//
//  Created by NikitaSergeevich on 18/12/2022.
//

import PhotosUI
import SwiftUI

struct EditUserInfoView: View {
	
	@EnvironmentObject var viewModel: MeViewModel
	@State var selectedItems: [PhotosPickerItem] = []
	
	@State var name = ""
	@State var email = ""
	@State var phoneNumber = ""
	@State var password = ""
	@State var passwordRep = ""
	@State var userImage = Image(systemName: "questionmark")
	@State var data: Data?
	
	
	var body: some View {
		VStack {
			
			Image(systemName: "chevron.down")
				.resizable()
				.frame(width: 30, height: 5)
				.foregroundColor(.gray)
				.padding(.vertical, 5)
			
			userIcon
				.frame(width: 100, height: 100)
			
			PhotosPicker(selection: $selectedItems, maxSelectionCount: 1, matching: .images) {
				HStack(spacing: 0){
					Text("choose image")
						.font(.subheadline)
				}
				.foregroundColor(.gray)
				.padding(0)
			}
			.onChange(of: selectedItems) { newValue in
				guard let item = selectedItems.first else {
					return
				}
				item.loadTransferable(type: Data.self) { result in
					switch result {
					case .success(let data):
						if let data = data {
							self.data = data
						} else {
							print("success load local image")
						}
					case .failure(let error):
						print("\(error)")
					}
				}
			}
			
			List {
				TextField("name", text: $name)
				Section {
					Button {
						
					} label: {
						HStack {
							Text("Change password")
							Spacer()
							Image(systemName: "chevron.right")
						}
						.foregroundColor(.black)
					}
					Button {
						
					} label: {
						HStack {
							Text("Change phone number")
							Spacer()
							Image(systemName: "chevron.right")
						}
						.foregroundColor(.black)
					}
				}
			}
			
			Button {
				
			} label: {
				Text("save")
					.font(.title3)
			}
			
		}
	}
	
	var userIcon: some View {
		ZStack {
			
			if let data = data, let uiImage = UIImage(data: data) {
				Image(uiImage: uiImage)
					.resizable()
					.scaledToFill()
					.foregroundColor(.gray)
			} else {
				userImage
					.resizable()
					.scaledToFill()
					.foregroundColor(.gray)
			}
			
			Circle()
				.stroke(lineWidth: 3)
				.foregroundColor(.gray)
			
		}
		.clipShape(Circle())
		.padding(0)
		
	}
	
}

struct EditUserInfoView_Previews: PreviewProvider {
	static var previews: some View {
		EditUserInfoView()
	}
}
