//
//  UserDefaultsTutorial.swift
//  iExpense
//
//  Created by Suyash Lunawat on 08/01/22.
//

import SwiftUI

struct UserDefaultsTutorial: View {
    @AppStorage("anotherTapCount") var anotherTapCount = 0
    
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    var body: some View {
        VStack{
        Button("Tap Count: \(tapCount)"){
            tapCount += 1
            UserDefaults.standard.set(tapCount, forKey: "Tap")
        }
            Button("Another Tap Count: \(anotherTapCount)"){
                anotherTapCount += 1
                
        }
        }
    }
}


struct UserDefaultsTutorial_Previews: PreviewProvider {
    static var previews: some View {
        UserDefaultsTutorial()
    }
}
