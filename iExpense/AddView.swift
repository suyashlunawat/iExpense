//
//  AddView.swift
//  iExpense
//
//  Created by Suyash Lunawat on 08/01/22.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismissSheet 
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Business","Personal"]
    var body: some View {
        NavigationView{
            Form{
                TextField("Name", text: $name)
                Picker("Type", selection: $type){
                    ForEach(types, id: \.self){
                        Text($0)
                    }
                    
                }
                TextField("Amount", value:$amount, format: .currency(code: Locale.current.currencyCode ?? "INR") )
                    .keyboardType(.decimalPad)
            }.navigationTitle("Add Expense")
                .toolbar {
                    Button("Save") {
                        let item = ExpenseItem(name: name, type: type, amount: amount)
                        if type == "Personal"{
                        expenses.items.append(item)
                        }
                        else {
                            expenses.BusinessItems.append(item)
                        }
                        dismissSheet()
                        
                    }
                }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
