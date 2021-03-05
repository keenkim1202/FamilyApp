//
//  HomeViewController.swift
//  FamilyApp
//
//  Created by KEEN on 2021/02/27.
//

import UIKit

class HomeViewController: UIViewController {
  
  // TODO : 레포지토리 활용하기?
  
  var userType: UserType?
  
  let searchController: UISearchController = UISearchController()

  var searchWord: String? = nil
  
  var entries: [UserType] = []
  var filteredEntries: [UserType] = []
  var selectedUserType: UserType?
  var filtered: Bool = false
  
  @IBOutlet weak var tableView: UITableView!
  
  var dummyList: [UserType] = [
    UserType(name: "나", state: "공부중", thumbnail: UIImage(named: "defaultProfile")),
    UserType(name: "엄마", state: "휴식중", thumbnail: UIImage(named: "defaultProfile")),
    UserType(name: "동생", state: "약속", thumbnail: UIImage(named: "defaultProfile"))
]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    searchController.searchResultsUpdater = self
    searchController.searchBar.placeholder = "이름으로 검색"
    navigationItem.searchController = searchController
    definesPresentationContext = true
  }
}

// MARK: TableView Delegate & DataSource
extension HomeViewController: UITableViewDelegate {
  func tableView(
    _ tableView: UITableView,
    heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 85
  }
}

extension HomeViewController: UITableViewDataSource {
  func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int) -> Int {
    return filtered ? filteredEntries.count : dummyList.count
  }
  
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "memberCell") as! HomeTableViewCell
    
    let member = filtered ? filteredEntries[indexPath.row] : dummyList[indexPath.row]
    
    cell.nameLabel.text = member.name
    cell.stateLabel.text = member.state
    cell.profileImage.image = member.thumbnail
    
    cell.alertButton.backgroundColor = UIColor(named: "primaryRed")
    cell.alertButton.layer.cornerRadius = CGFloat(8)
    cell.messageButton.backgroundColor = UIColor(named: "primaryBlue")
    cell.messageButton.layer.cornerRadius = CGFloat(8)
    
    return cell
  }
  
  func tableView(
    _ tableView: UITableView,
    willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    selectedUserType = filtered ? filteredEntries[indexPath.row] : entries[indexPath.row]
    if let cell = tableView.cellForRow(at: indexPath) as? HomeTableViewCell {
      selectedUserType?.thumbnail = cell.profileImage.image
    }
    return indexPath
  }
}

// MARK: UISearchResultsUpdating
extension HomeViewController: UISearchResultsUpdating {
  func updateSearchResults(
    for searchController: UISearchController) {
    let searchWord = searchController.searchBar.text

    guard self.searchWord != searchWord else { return }
    filtered = (searchWord?.isEmpty ?? true).negate
    
    if filtered {
      filteredEntries = dummyList.filter({ (user: UserType) -> Bool in
        return user.name.lowercased().contains(searchWord!.lowercased())
      })
    }
    tableView.reloadData()
  }
}
