//
//  AccountViewModel.swift
//  ShopetizersGHB
//
//  Created by Samit Koyom on 17/6/2568 BE.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    // สร้างตัวแปรรับค่าจาก Model
    @Published var user = User()
    
    // สร้างตัวแปรรับค่าจาก Alert
    @Published var alertItem: AlertItem?
    
    // สร้างตัวแปรแบบ @AppStorage ไว้บันทึกค่าลงในแอพ
    @AppStorage("user") private var userData: Data?
    
    // สร้างฟังก์ชัน Validation Form
    var isValidForm: Bool {
        
        guard !user.firstname.isEmpty && !user.lastname.isEmpty && !user.email.isEmpty else {
            // แสดง Alert
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            // แสดง Alert
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    // สร้างฟังก์ชัน Save Form
    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            
            // บันทึกข้อมุลลง @AppStorage
            userData = data
            
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    // อ่าน user จาก @AppStorage
    func retrieveUser() {
        guard let userData = userData else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
}
