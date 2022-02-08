//
//  ContentView.swift
//  iExpense
//
//  Created by Suyash Lunawat on 03/01/22.
//

import SwiftUI
struct SecondView: View {
    @Environment(\.dismiss) var dismissView
    var name = "Suyash"
    var body: some View {
        VStack {
        Text("Welcome to the Second View, \(name)")
            Button ("Dismiss This Sheet") {
                dismissView()
            }
        }
    }
}

class Username: ObservableObject {
    @Published var firstName = "Suyash"
    @Published var lastName = "Lunawat"
}

struct ContentView: View {
    @State private var showingSecondScreen = false
    @StateObject var user = Username()
    @StateObject var anotherUser = Username()
    var body: some View {
        VStack {
            Text("My name is \(user.firstName) \(user.lastName)")
            TextField ("First Name", text: $user.firstName)
            TextField("Last Name", text: $user.lastName)
            
            Text("My name is \(anotherUser.firstName) \(anotherUser.lastName)")
            TextField ("First Name", text: $anotherUser.firstName)
            TextField("Last Name", text: $anotherUser.lastName)
            
            Button("Show SecondScreen") {
                showingSecondScreen.toggle()
            }
            .sheet(isPresented: $showingSecondScreen) {
                SecondView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
