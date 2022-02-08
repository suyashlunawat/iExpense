//
//  iExpense.swift
//  iExpense
//
//  Created by Suyash Lunawat on 08/01/22.
//

import SwiftUI

struct iExpense: View {
    @StateObject var expenses = Expenses()
    @State private var addViewIsShown = false
    var currencyFormatter: FloatingPointFormatStyle<Double>.Currency {
        return .currency(code: Locale.current.currencyCode ?? "INR")
    }

    var body: some View {
        NavigationView {
            
            List {
                Section {
                ForEach(expenses.items){ item in
                    HStack {
                        VStack(alignment: .leading){
//                        Text(item.type)
                    
                    Text(item.name)
                        }
                    Spacer()
                        Text(item.amount, format: currencyFormatter)
                            .foregroundColor(item.amount<10 ? .green : item.amount<100 ? .blue : .pink)
                 
                            
                            
                    
                    }
                }.onDelete(perform: removeItems)
                }header: {
                    if !expenses.items.isEmpty {
                    Text("Personal")
                    }
                }
                Section {
                ForEach(expenses.BusinessItems){ item in
                    HStack {
                        VStack(alignment: .leading){
//                        Text(item.type)
                    
                    Text(item.name)
                        }
                    Spacer()
                        Text(item.amount, format: currencyFormatter)
                            .foregroundColor(item.amount<10 ? .green : item.amount<100 ? .blue : .pink)
                 
                            
                            
                    
                    }
                }.onDelete(perform: removeBusinessItems)
                }header: {
                    if !expenses.BusinessItems.isEmpty {
                        Text("Business")
                    }
                }
            }.navigationTitle("iExpense")
                .toolbar {
                    Button("➕") {
                        addViewIsShown.toggle()
                    }
                }
        }.sheet(isPresented: $addViewIsShown) {
            AddView(expenses:expenses)
        }
    }
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    func removeBusinessItems(at offsets: IndexSet) {
        expenses.BusinessItems.remove(atOffsets: offsets)
    }
}

struct iExpense_Previews: PreviewProvider {
    static var previews: some View {
        iExpense()
    }
}

