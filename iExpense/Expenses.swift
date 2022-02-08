//
//  Expenses.swift
//  iExpense
//
//  Created by Suyash Lunawat on 08/01/22.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
    didSet  {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(items) {
            UserDefaults.standard.set(encoded, forKey: "Items")
        }
    }
    }
    @Published var BusinessItems = [ExpenseItem]() {
        didSet  {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(BusinessItems) {
                UserDefaults.standard.set(encoded, forKey: "BusinessItems")
            }
        }
    }
    
        init() {
            if let savedItems = UserDefaults.standard.data(forKey: "Items") {
                if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                    items = decodedItems
                    
                    return
                }
                if let businessSavedItems = UserDefaults.standard.data(forKey: "BusinessItems"){
                    if let decodedBusinessItems = try? JSONDecoder().decode([ExpenseItem].self, from: businessSavedItems) {
                        BusinessItems = decodedBusinessItems
                        return
                    }
                }
        }
            items = []
            BusinessItems = []
}
}

 
