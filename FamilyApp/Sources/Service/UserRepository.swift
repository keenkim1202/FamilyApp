//
//  UserRepository.swift
//  FamilyApp
//
//  Created by KEEN on 2021/03/04.
//

import Foundation

protocol UserRepositoryType {
  var count: Int { get }
  func user(indexRow: Int) -> UserType?
  func add(userType: UserType)
  func fetch() -> [UserType]
//  func update()
//  func remove()
}

class UserRepository: UserRepositoryType {
  private var items: [UserType]
  
  init() {
    items = []
  }
  
  var count: Int {
    return items.count
  }
  
  func add(userType: UserType) {
    items.append(userType)
  }
  
  func user(indexRow: Int) -> UserType? {
    guard indexRow < count else { return nil }
    return items[indexRow]
  }
  
  func fetch() -> [UserType] {
    return []
  }

}
