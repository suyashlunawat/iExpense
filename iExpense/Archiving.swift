//
//  Archiving.swift
//  iExpense
//
//  Created by Suyash Lunawat on 08/01/22.
//

import SwiftUI

struct User: Codable {
    let firstName: String
    let lastNAme: String
}

struct Archiving: View {
    @State private var user = User(firstName: "Suyash", lastNAme: "Lunawat")
    
    var body: some View {
        Button("Save") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

struct Archiving_Previews: PreviewProvider {
    static var previews: some View {
        Archiving()
    }
}
