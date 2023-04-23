//
//  ContentView.swift
//  IExpense
//
//  Created by Taras Kyparenko on 19/4/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ExpenseSection(title: "Personal", expenses: expenses.personalItems, deleteItems: removePersonalItems)
                
                ExpenseSection(title: "Business", expenses: expenses.businessItems, deleteItems: removeBusinessItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
            
        }
    }
    
    func removeItems(at offsets: IndexSet, in inputArray: [ExpenseItem]) {
        var objectsToDelete = IndexSet()
        for offset in offsets {
            let item = inputArray[offset]
            
            if let index = expenses.items.firstIndex(of: item) {
                objectsToDelete.insert(index)
            }
        }
        
        expenses.items.remove(atOffsets: objectsToDelete)
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.personalItems)
    }
    func removeBusinessItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.businessItems)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



////class User: ObservableObject {
////   @Published var firstName = "Bob"
////   @Published var lastName = "Tornton"
////}
//
////struct SecondView: View {
////    @Environment(\.dismiss) var dismiss
////
////    let name: String
////    var body: some View {
////        Text("Hello \(name)")
////        Button("Dismiss") {
////            dismiss()
////        }
////        .frame(width: 200, height: 100)
////        .background(.yellow)
////        .clipShape(RoundedRectangle(cornerRadius: 20))
////        .foregroundColor(.mint)
////    }
////}
//
//struct ContentView: View {
//    @State private var numbers = [Int]()
//    @State private var currentNumber = 1
//
//
////    @StateObject var user = User()
////
////    @State private var shovingSheet = false
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                List {
//                    ForEach(numbers, id: \.self) {
//                        Text("Row \($0)")
//                    }
//                    .onDelete(perform: removeRows)
//                }
//
//                Button("Edd Number") {
//                    numbers.append(currentNumber)
//                    currentNumber += 1
//                }
//
//                //                Button("Show Sheet") {
//                //                    shovingSheet.toggle()
//                //                }
//                //                .frame(width: 200, height: 100)
//                //                .background(.yellow)
//                //                .clipShape(RoundedRectangle(cornerRadius: 20))
//                //                .foregroundColor(.mint)
//                //
//                //                .sheet(isPresented: $shovingSheet) {
//                //                    SecondView(name: "Tramtaram")
//                //                }
//                //
//                //                Text("Your name is \(user.firstName) \(user.lastName)")
//                //
//                //                TextField("First name", text: $user.firstName)
//                //                TextField("Last name", text: $user.lastName)
//                //            }
//            }
//            .navigationTitle("onDelete")
//            .toolbar {
//                EditButton()
//            }
//        }
//    }
//
//    func removeRows(at offsets: IndexSet) {
//        numbers.remove(atOffsets: offsets)
//
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
