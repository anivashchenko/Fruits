////
////  FilteredViewByColors.swift
////  Fruits
////
////  Created by Анастасія on 08.12.2022.
////
//
//import SwiftUI
//
//struct FilteredViewByColors: View {
//
//    @Binding var selectedColor: Food.Color
//
//    @AppStorage("color") var currentColor: Food.Color = .allColor
//    @AppStorage("toggle") var isToggleOn: Bool = false
//
//    @State var colors: [Food.Color] = [.yellow, .orange, .red, .green]
//
//    @Environment(\.presentationMode) var presentationMode
//
//    var body: some View {
//        VStack {
//
//            Button {
//                if isToggleOn {
//                    currentColor = selectedColor
//                } else {
//                    currentColor = .allColor
//                    selectedColor = .allColor
//                }
//                presentationMode.wrappedValue.dismiss()
//            } label: {
//                Image(systemName: "xmark.square.fill")
//                    .foregroundColor(Color(uiColor: .darkGray))
//                    .font(.title3)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding()
//            }
//
//            if isToggleOn == false || selectedColor == .allColor {
//                Text("Current color of fruits - no selected, so you can see all the list.")
//                    .font(.callout)
//                    .bold()
//                    .multilineTextAlignment(.center)
//                    .padding(.horizontal, 30)
//            }
//
//            Toggle(isOn: $isToggleOn) {
//                    Text("Do wou want to choose the color of fruits?")
//                        .font(.title3)
//                        .bold()
//            }
//            .padding(.horizontal, 30)
//            .padding(.top, (isToggleOn == false || selectedColor == .allColor) ? 8 : 60)
//            .tint(.gray)
//
//            if isToggleOn {
//                List {
//                    Picker("Colour of fruit",
//                           selection: $selectedColor) {
//                        ForEach(colors, id: \.self) { color in
//                            Text("\(color.rawValue)")
//                        }
//                    }
//                    .pickerStyle(.inline)
//                }
//                .padding(.horizontal)
//                .frame(height: 230)
//                .cornerRadius(10)
//
//            }
//
//            if isToggleOn == true && selectedColor == .allColor {
//                Text("Choosing the color ...")
//                    .font(.callout)
//                    .bold()
//                    .multilineTextAlignment(.center)
//                    .padding(.horizontal, 30)
//            }
//
//            if isToggleOn && selectedColor != .allColor {
//                Text("Now color of fruits is \(selectedColor.rawValue.uppercased()).")
//                    .font(.callout)
//                    .bold()
//            }
//
//            Spacer()
//        } // END VSTACK
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color("DarkGreen").opacity(0.3))
//    }
//}
//
////struct FilteredViewByColors_Previews: PreviewProvider {
////    static var previews: some View {
////        FilteredViewByColors(selectedColor: Fruit.Color.allColor)
////    }
////}
