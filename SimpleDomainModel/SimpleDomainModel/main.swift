//
//  main.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import Foundation

print("Hello, World!")

public func testMe() -> String {
  return "I have been tested"
}

open class TestMe {
  open func Please() -> String {
    return "I have been tested"
  }
}

////////////////////////////////////
// Money
//
public struct Money {
    public var amount : Int
    public var currency : String
    
    init(amount: Int, currency: String) {
        self.amount = amount
        self.currency = currency
    }
  
    public func convert(_ to: String) -> Money {
        var result = 0
        switch (currency, to) {
        case ("USD", "GBP"):
            result = self.amount / 2
        case ("GBP" , "USD"):
            result = self.amount * 2
        case ("USD", "EUR"):
            result = Int(Double(self.amount) * 1.5)
        case ("EUR", "USD"):
            result = Int(Double(self.amount) / 1.5)
        case ("USD", "CAN"):
            result = Int(Double(self.amount) * 1.25)
        case ("CAN", "USD"):
            result = Int(Double(self.amount) / 1.25)
        default:
            result = self.amount
        }
        return Money(amount: result, currency: to)
    }
  
    public func add(_ to: Money) -> Money {
        let convertedMoney = self.convert(to.currency)
        let result = convertedMoney.amount + to.amount
        return Money(amount: result, currency: to.currency)
    }
    
    public func subtract(_ from: Money) -> Money {
        let convertedMoney = self.convert(from.currency)
        let result = convertedMoney.amount - from.amount
        return Money(amount: result, currency: from.currency)
    }
}

// TESTS
//let tenUSD = Money(amount: 10, currency: "USD")
//print(tenUSD.convert("GBP"))
//let fifteenEUR = Money(amount: 15, currency: "EUR")
//print(fifteenEUR.convert("USD"))

////////////////////////////////////
// Job
//
open class Job {
    fileprivate var title : String
    fileprivate var type : JobType

    public enum JobType {
        case Hourly(Double)
        case Salary(Int)
    }
  
    public init(title : String, type : JobType) {
        self.title = title
        self.type = type
    }
  
    open func calculateIncome(_ hours: Int) -> Int {
        switch self.type {
        case .Hourly(let income):
            return Int(income) * hours
        case .Salary(let income):
            return income
        }
    }
  
    open func raise(_ amt : Double) {
        switch self.type {
        case .Hourly(let income):
            self.type = JobType.Hourly(income + amt)
        case .Salary(let income):
            self.type = JobType.Salary(income + Int(amt))
        }
    }
}

////////////////////////////////////
// Person
/*
open class Person {
  open var firstName : String = ""
  open var lastName : String = ""
  open var age : Int = 0

  fileprivate var _job : Job? = nil
  open var job : Job? {
    get { }
    set(value) {
    }
  }
  
  fileprivate var _spouse : Person? = nil
  open var spouse : Person? {
    get { }
    set(value) {
    }
  }
  
  public init(firstName : String, lastName: String, age : Int) {
    self.firstName = firstName
    self.lastName = lastName
    self.age = age
  }
  
  open func toString() -> String {
  }
}

////////////////////////////////////
// Family
//
open class Family {
  fileprivate var members : [Person] = []
  
  public init(spouse1: Person, spouse2: Person) {
  }
  
  open func haveChild(_ child: Person) -> Bool {
  }
  
  open func householdIncome() -> Int {
  }
}

*/



