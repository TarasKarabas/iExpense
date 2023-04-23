//
//  Expenseitem.swift
//  IExpense
//
//  Created by Taras Kyparenko on 20/4/2023.
//

import Foundation

struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
