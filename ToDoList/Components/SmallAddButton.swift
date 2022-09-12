//
//  SmallAddButton.swift
//  ToDoList
//
//  Created by Leith on 11/9/2022.
//

import SwiftUI

struct SmallAddButton: View {
    var body: some View {
        ZStack(alignment: .center){
//            Color.red
            Circle()
                .frame(width:50)
                .foregroundColor(.white)
            Text("+")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.blue)

        }
        .frame(height: 50)
            }
}

struct SmallAddButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallAddButton()
    }
}
