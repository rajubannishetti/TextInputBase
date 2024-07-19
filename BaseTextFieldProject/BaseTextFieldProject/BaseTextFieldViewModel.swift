//
//  BaseTextFieldViewModel.swift
//  BaseTextFieldProject
//
//  Created by raju.bannishetti on 11/07/24.
//

import Foundation
import SwiftUI

class BaseTextFieldViewModel: ObservableObject {
    @Published  var model: BaseTextfieldModel
    init(model: BaseTextfieldModel) {
        self.model = model
    }
    
    func validateInput() {
            switch model.fieldType {
            case .email:
                model.showError = !isValidEmail(model.inputTextData)
                model.errorMessage = model.showError ? "Invalid email address" : ""
//            case .password:
//                model.showError = model.inputTextData.count < 6
//                model.errorMessage = model.showError ? "Password must be at least 6 characters" : ""
//            case .number:
//                model.showError = !isValidNumber(model.inputTextData)
//                model.errorMessage = model.showError ? "Invalid number" : ""
            case .phNumber:
                model.errorMessage = model.showError ? "Invalid Phone Number" : ""
            case .entertext:
                model.errorMessage = model.showError ? "please enter text" : ""
            }
        }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
//    func phoneNumber(_ phNumber: String) -> Bool {
//        
//    }
    
    func keyboardType(type: textFieldtype) -> UIKeyboardType {
        
        switch type{
        case .email:
            return UIKeyboardType.emailAddress
        case .phNumber:
            return UIKeyboardType.phonePad
        case .entertext:
            return UIKeyboardType.emailAddress
        }
    }
    
}
