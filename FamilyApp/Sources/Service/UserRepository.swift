//
//  UserRepository.swift
//  FamilyApp
//
//  Created by KEEN on 2021/03/04.
//

import Foundation

protocol UserRepositoryType {
  var count: Int { get }
  func user() -> UserType?
  func add(userType: UserType)
  func fetch() -> [UserType]
}
