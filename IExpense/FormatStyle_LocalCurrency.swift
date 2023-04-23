//
//  FormatStyle_LocalCurrency.swift
//  IExpense
//
//  Created by Taras Kyparenko on 21/4/2023.
//

import Foundation

extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency {
    static var localCurrency: Self {
        .currency(code: Locale.current.currency?.identifier ?? "USD")
    }
}
