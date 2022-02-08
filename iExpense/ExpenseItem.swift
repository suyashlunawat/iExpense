//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Suyash Lunawat on 08/01/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
