//
//  main.swift
//  Store
//
//  Created by Ted Neward on 2/29/24.
//

import Foundation

protocol SKU {
    var name: String { get }
    func price() -> Int
}

class Item: SKU {
    let name: String
    let priceEach: Int
    
    init(name: String, priceEach: Int) {
        self.name = name
        self.priceEach = priceEach
    }
    
    func price() -> Int {
        return priceEach
    }
}

class Receipt {
    private var skuItems: [SKU] = []
    
    func addItem(_ item: SKU) {
        skuItems.append(item)
    }
    
    func items() -> [SKU] {
        return skuItems
    }
    
    func total() -> Int {
        return skuItems.reduce(0) { $0 + $1.price() }
    }
    
    func output() -> String {
        var output = "Receipt:\n"
        for item in skuItems {
            let priceInDollars = Double(item.price()) / 100.0
            output += "\(item.name): $\(String(format: "%.2f", priceInDollars))\n"
        }
        output += "------------------\n"
        let totalInDollars = Double(total()) / 100.0
        output += "TOTAL: $\(String(format: "%.2f", totalInDollars))"
        return output
    }
}

class Register {
    private var currentReceipt: Receipt
    
    init() {
        currentReceipt = Receipt()
    }
    
    func scan(_ item: SKU) {
        currentReceipt.addItem(item)
    }
    
    func subtotal() -> Int {
        return currentReceipt.total()
    }
    
    func total() -> Receipt {
        let receipt = currentReceipt
        currentReceipt = Receipt()
        return receipt
    }
}

class Store {
    let version = "0.1"
    func helloWorld() -> String {
        return "Hello world"
    }
}

