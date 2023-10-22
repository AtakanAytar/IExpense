//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Atakan Aytar on 17.09.2023.
//

import Foundation

struct ExpenseItem : Identifiable , Codable {
    let id = UUID()
    let name : String
    let type : String
    let amount : Double
}
