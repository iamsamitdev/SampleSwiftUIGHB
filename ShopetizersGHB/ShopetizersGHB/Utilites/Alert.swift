//
//  Alert.swift
//  ShopetizersGHB
//
//  Created by Samit Koyom on 17/6/2568 BE.
//

import SwiftUI

struct AlertItem: Identifiable {
    
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    
    //MARK: - Network API Alert
    static let invalidData      = AlertItem(title: Text("มีข้อผิดพลาดจาก Server"),
    message: Text("รูปแบบข้อมูลที่ได้ไม่ถูกต้อง กรุณาติดต่อผู้ดูแล"),
    dismissButton: .default(Text("OK")))
    
    static let invalidResponse  = AlertItem(title: Text("มีข้อผิดพลาดจาก Server"),
                                            message: Text("ไม่มีการตอบกลับจาก Server กรุณาติดต่อผู้ดูแล"),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidURL       = AlertItem(title: Text("มีข้อผิดพลาดจาก Server"),
                                            message: Text("URL ที่เรียกไม่สามารถใช้งานได้ กรุณาติดต่อผู้ดูแล"),
                                            dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: Text("มีข้อผิดพลาดจาก Server"),
                                            message: Text("ไม่สามารถเรียกใช้ข้อมูลได้ในขณะนี้ กรุณาติดต่อผู้ดูแล"),
                                            dismissButton: .default(Text("OK")))
    
    //MARK: - Account Form Alert
    static let invalidForm      = AlertItem(title: Text("มีข้อผิดพลาด"),
                                            message: Text("ป้อนข้อมูลในฟอร์มให้ครบก่อน"),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidEmail     = AlertItem(title: Text("มีข้อผิดพลาด"),
                                            message: Text("รูปแบบอีเมล์ที่ป้อนไม่ถูกต้อง"),
                                            dismissButton: .default(Text("OK")))
    
    static let userSaveSuccess  = AlertItem(title: Text("อัพเดทโปรไฟล์สำเร็จ"),
                                            message: Text("ข้อมูลโปรไฟล์ของคุณถูกบันทึกเรียบร้อยแล้ว"),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidUserData  = AlertItem(title: Text("มีข้อผิดพลาด"),
                                            message: Text("ไม่สามารถบันทึกข้อมูลโปรไฟล์ของคุณได้"),
                                            dismissButton: .default(Text("OK")))
    
}
