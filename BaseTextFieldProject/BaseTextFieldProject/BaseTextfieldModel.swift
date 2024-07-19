//
//  BaseTextfieldModel.swift
//  BaseTextFieldProject
//
//  Created by raju.bannishetti on 11/07/24.
//

import Foundation
import SwiftUI
//struct BaseTextfieldModel {
//    var placeholder: String
//    var textData: String
//}

struct BaseTextfieldModel {
    var placeHolder: String
    var inputTextData: String = "hjhcdksjhfkjsahkdsajfkldsjfkjdskjfhsdkjhkjdsnckbdncjbdfjhcvhdskljbnckjldsbcljdsbnckljbdsljkcbndksjbckjdsbcdnfkdsnfkjndskjnfdksj"
    var fieldType: textFieldtype
    var errorMessage: String
    var showError: Bool
    var icon: Image
}
