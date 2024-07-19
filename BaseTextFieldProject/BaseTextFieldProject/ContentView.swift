//
//  ContentView.swift
//  BaseTextFieldProject
//
//  Created by raju.bannishetti on 11/07/24.
//

import SwiftUI

enum textFieldtype: String {
    case email = "Email Id"
    case phNumber = "Phone Number"
    case entertext = "Enter text"
    
}

struct ContentView: View {
//    var type = textFieldtype.email
//    
    
    @ObservedObject private var data: BaseTextFieldViewModel =  BaseTextFieldViewModel(model: BaseTextfieldModel(placeHolder: "", inputTextData: "", fieldType: textFieldtype.email, errorMessage: "", showError: false, icon: Image(systemName: "multiply.circle.fill")))
    @ObservedObject private var data1: BaseTextFieldViewModel =  BaseTextFieldViewModel(model: BaseTextfieldModel(placeHolder: "", inputTextData: "", fieldType: textFieldtype.phNumber, errorMessage: "", showError: false, icon: Image(systemName: "multiply.circle.fill")))
    var body: some View {
//        switch(type) {
//        case .email:
        
//        case.phNumber:
//            textFiledView(type: type.rawValue)
//        }
        
//        textFiledView(type: textFieldtype.email.rawValue)
//        textFiledView(type: textFieldtype.phNumber.rawValue)
        textFiledView(data: data)
        textFiledView(data: data1)
    }
}

#Preview {
    ContentView()
}

struct OutlinedTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(Color(UIColor.systemGray4), lineWidth: 2)
            }
    }
}


struct textFiledView: View {
//    @ObservedObject private var data: BaseTextFieldViewModel =  BaseTextFieldViewModel(model: BaseTextfieldModel(placeHolder: "", inputTextData: "", fieldType: textFieldtype.email, errorMessage: "", showError: false, icon: Image(systemName: "multiply.circle.fill")))
    //BaseTextFieldViewModel(bData: BaseTextfieldModel(placeholder: "", textData: ""))
    
    @Environment(\.sizeCategory) var sizeCategory
        
    private func scaledFontSize(baseSize: CGFloat) -> CGFloat {
        switch sizeCategory {
        case .extraSmall: return baseSize * 0.8
        case .small: return baseSize * 0.9
        case .medium: return baseSize * 1.0
        case .large: return baseSize * 1.1
        case .extraLarge: return baseSize * 1.2
        case .extraExtraLarge: return baseSize * 1.3
        case .extraExtraExtraLarge: return baseSize * 1.4
        case .accessibilityMedium: return baseSize * 1.5
        case .accessibilityLarge: return baseSize * 1.6
        case .accessibilityExtraLarge: return baseSize * 1.7
        case .accessibilityExtraExtraLarge: return baseSize * 1.8
        case .accessibilityExtraExtraExtraLarge: return baseSize * 1.9
        default: return baseSize
        }
    }
    
    @ObservedObject var data: BaseTextFieldViewModel
    //let type: String
    @FocusState private var textFieldFocused: Bool
    
//    var body: some View {
//        
//        ZStack(alignment: .leading) {
//            Text(type)
//                .foregroundStyle(data.model.showError ? Color.red : Color.gray)
//                .offset(y: data.model.inputTextData.isEmpty ? 0 :-23)
//                .scaleEffect(data.model.inputTextData.isEmpty ? 1 : 0.8, anchor: .leading)
//                .labelStyle(.iconOnly)
//                .padding()
//           
//                TextField("", text: $data.model.inputTextData, onEditingChanged: { editing in
//                    withAnimation {
//                        //isEditing = editing
//                    }
//                }, onCommit: {
//                    self.data.validateInput()
//                })
//                    .focused($textFieldFocused)
//                    .frame(height: 50)
//                    .textFieldStyle(OutlinedTextFieldStyle())
//                    //.modifier(ClearButton(text: $data.model.inputTextData))
//                    .overlay(alignment: .trailing) {
//                        if textFieldFocused && !data.model.inputTextData.isEmpty {
//                            Button(action: {
//                                print("button pressed")
//                                data.model.inputTextData = ""
//                            }) {
//                                Image(systemName: "multiply.circle.fill")
//                                    .foregroundColor(Color(UIColor.opaqueSeparator))
//                                    
//                            }.padding(.trailing, 10)
//                        } else if data.model.showError {
//                            
//                            Image(systemName: "multiply.circle.fill")
//                                .foregroundColor(Color(UIColor.red))
//                                .padding(.trailing, 10)
//                            
//                        }
//                        
//                    }
//          
//                
//            if data.model.showError {
//                Text(data.model.errorMessage)
//                    .padding(.top, 50)
//                    .padding(.bottom, 10)
//                    .foregroundColor(.red)
//                    .opacity(1)
//                    .padding(.leading, 20)
//                    .scaleEffect(data.model.inputTextData.isEmpty ? 1 : 0.8, anchor: .leading)
//            } else {
//                Text(data.model.errorMessage)
//                    .padding(.top, 50)
//                    .padding(.bottom, 5)
//                    .foregroundColor(.red)
//                    .opacity(0)
//                    .padding(.leading, 20)
//                    .scaleEffect(data.model.inputTextData.isEmpty ? 1 : 0.8, anchor: .leading)
//            }
//                
//            
//            Spacer()
//            
//        }.padding([.leading, .trailing], 20)
//            //.frame(height: 70)
//    }
    
    @State private var text: String = ""
    @State private var isEditing: Bool = false
    
    @ViewBuilder
    private var labelTextField: some View {
        if data.model.inputTextData == "" || data.model.inputTextData.isEmpty {
            
            Text(data.model.fieldType.rawValue)
            //.foregroundStyle(Color.gray)
                .font(.system(size: scaledFontSize(baseSize: 13), weight: .medium))
                
                .minimumScaleFactor(13 / 0.04)
                .foregroundColor(Color.gray)
                .offset(y: data.model.inputTextData.isEmpty ? 0 :-23)
                .scaleEffect(data.model.inputTextData.isEmpty ? 1 : 0.8, anchor: .leading)
            //.labelStyle(.iconOnly)
                .padding()
                .onAppear{
                    data.model.showError = false
                }
            Spacer()
        } else {
            Text(data.model.fieldType.rawValue)
                .font(.system(size: scaledFontSize(baseSize: 13), weight: .medium))
                .minimumScaleFactor(13 / 0.04)
            //.foregroundStyle(data.model.showError ? Color.red  : Color.gray)
                .foregroundColor(data.model.showError ? Color.red  : Color.gray)
                .offset(y: data.model.inputTextData.isEmpty ? 0 :-23)
                .scaleEffect(data.model.inputTextData.isEmpty ? 1 : 0.8, anchor: .bottomLeading)
            //.labelStyle(.iconOnly)
                .padding()
            
            Spacer()
        }
    }
    
    @ViewBuilder
    private var errorLabel: some View {
        if !data.model.inputTextData.isEmpty {
            if data.model.showError {
                
                Text(data.model.errorMessage)
                    .padding(.top, 60)
                    .font(.system(size: scaledFontSize(baseSize: 13), weight: .medium))
                //.padding(.bottom, 10)
                    .foregroundColor(.red)
                    .opacity(1)
                    .padding(.leading, 20)
                    .scaleEffect(data.model.inputTextData.isEmpty ? 1 : 0.8, anchor: .leading)
                
            } else {
                Text(data.model.errorMessage)
                    .padding(.top, 0)
                //.padding(.bottom, 5)
                    .font(.system(size: scaledFontSize(baseSize: 13), weight: .medium))
                    .foregroundColor(.red)
                    .opacity(0)
                    .padding(.leading, 20)
                    .scaleEffect(data.model.inputTextData.isEmpty ? 1 : 0.8, anchor: .leading)
            }
        }
    }
    
    var body: some View {
      
       ZStack(alignment: .leading) {
           labelTextField
           
           HStack {
//               TextField("", text:  $data.model.inputTextData, axis: .vertical)
//                   .onAppear {
//                       isEditing = true
//                       self.data.validateInput()
//                   }
//                   .onSubmit({
//                       self.data.validateInput()
//                   })
//                   .submitLabel(.go)
               TextField("", text: $data.model.inputTextData, onEditingChanged: { editing in
                   withAnimation {
                       isEditing = editing
                   }
               }, onCommit: {
                   self.data.validateInput()
               })
               .lineLimit(1...2)
               
               .font(.system(size: scaledFontSize(baseSize: 17), weight: .medium))
               .minimumScaleFactor(17 / 0.05)
               .padding(.top, data.model.inputTextData.isEmpty ? 0 : 10)
               .keyboardType(data.keyboardType(type: data.model.fieldType))
               
               
               if !data.model.inputTextData.isEmpty {
                   Button(action: {
                       
                       print("Button tapped")
                       data.model.inputTextData = ""
                       data.model.showError = false
                       
                   }) {
                       if data.model.showError {
                           Image("error")
                           
                               .padding(.trailing, 10)
                       } else {
                           if isEditing {
                               Image("cross")
                               
                                   .padding(.trailing, 10)
                           }
                           
                       }
                       
                       
                   }
               }

               
               Spacer()
           }.padding(.leading, 15)
               .frame(height: data.model.showError ? 88 : 66)
               
           errorLabel
          
       }//.background(Color(UIColor.systemGray5))
           .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                           .stroke(Color.gray, lineWidth: 1))
           .padding()
           .cornerRadius(10)
           
     
    }
}




struct ClearButton: ViewModifier
{
    @Binding var text: String
    @FocusState var focused: Bool
    public func body(content: Content) -> some View
    {
        ZStack(alignment: .trailing)
        {
            content

            if !text.isEmpty
            {
                Button(action:
                {
                    self.text = ""
                })
                {
                    
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(Color(UIColor.opaqueSeparator))
                }
                .padding(.trailing, 8)
                
            }
        }
    }
}

//struct ClearButton1: ViewModifier {
//    @Binding var text: String
//    
//    func body(content: Content) -> some View {
//        
//        HStack {
//            content
//            if !text.isEmpty {
//                Button {
//                    text = ""
//                }label: {
//                    Image(systemName: "multiply.circle.fill")
//                        .foregroundColor(.gray)
//                }
//                .padding(.trailing, 5)
//            }
//        }
//    }
//}

//extension View {
//    func clearButton(text: Binding<String>) -> some View {
//        modifier(ClearButton(text: text))
//    }
//}
