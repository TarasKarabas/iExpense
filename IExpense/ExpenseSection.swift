//
//  ExpenseSection.swift
//  IExpense
//
//  Created by Taras Kyparenko on 21/4/2023.
//

import SwiftUI

struct ExpenseSection: View {
    
    let title: String
    let expenses: [ExpenseItem]
    let deleteItems: (IndexSet) -> Void
    
    var body: some View {
        Section(title) {
            ForEach(expenses) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                    }
                    Spacer()
                    
                    Text(item.amount, format: .localCurrency)
                        .style(for: item)
                }
                .listRowBackground(changeColor(amount: item.amount))
            }
            .onDelete(perform: deleteItems)
        }
    }
    
    func changeColor(amount: Double) -> Color {
        var color: Color = .clear
        if amount <= 10 {
            color = .yellow
        } else if amount <= 100 {
            color = .orange
        } else if amount > 100 {
            color = .red
        }
        return color
    }
}

struct ExpenseSection_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseSection(title: "Example", expenses: []) { _ in }
    }
}
