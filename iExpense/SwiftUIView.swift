//
//  SwiftUIView.swift
//  iExpense
//
//  Created by Suyash Lunawat on 08/01/22.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var numbers = [Int]()
    @State private var selectedNumber = 1
    var body: some View {
        NavigationView{
        VStack {
            List {
                ForEach(numbers, id: \.self){
                    Text("Row \($0)")
                } .onDelete(perform: removeRows)
                    Button("Add number") {
                        numbers.append(selectedNumber)
                        selectedNumber += 1
                    }
                }
            List(numbers, id: \.self){
                Text("Row \($0)")
            }
        } .navigationTitle("onDeleteTutorial")
                .toolbar {
                    EditButton()
                }
    }
        }
    func removeRows(at offsets: IndexSet){
        numbers.remove(atOffsets: offsets)
    }
    }


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
