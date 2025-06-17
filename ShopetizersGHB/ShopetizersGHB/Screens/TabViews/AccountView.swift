//
//  AccountView.swift
//  ShopetizersGHB
//
//  Created by Samit Koyom on 17/6/2568 BE.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(
                    header: Text("Personal Info")
                        .padding(.leading, -20)
                        .padding(.bottom, 5)
                ){
                    TextField("First Name", text: $viewModel.user.firstname)
                    TextField("Last Name", text: $viewModel.user.lastname)
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Birth Date",
                               selection: $viewModel.user.birthdate,
                               displayedComponents: .date)
                    
                    Button {
                        // print("Saved")
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Change")
                    }
                }
                
                Section(
                    header: Text("Requests")
                        .padding(.leading, -20)
                        .padding(.bottom, 5)
                ){
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                }
                .navigationTitle("🤣 Account")
            }
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
            }
            .onAppear {
                viewModel.retrieveUser()
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
