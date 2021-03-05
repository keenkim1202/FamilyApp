//
//  HomeViewController.swift
//  FamilyApp
//
//  Created by KEEN on 2021/02/27.
//

import UIKit

class HomeViewController: UIViewController {
  
  // TODO : searchBar 연결해서 검색 되도록 하기
  // TODO : 매세지 목록 탭 화면 구성하기
  
  var userType: UserType?
  var searchWord: String? = nil
  let searchController: UISearchController = UISearchController()

  var dummyList: [UserType] = [
    UserType(name: "kate", state: "공부중", thumbnail: UIImage(named: "defaultProfile")),
    UserType(name: "keen", state: "휴식중", thumbnail: UIImage(named: "defaultProfile"))]
  
  @IBOutlet weak var tableView: UITableView!

  
  override func viewDidLoad() {
    super.viewDidLoad()
    searchController.searchBar.placeholder = "이름으로 검색을 할 수 있습니다."
    navigationItem.searchController = searchController
  }

}

// MARK: TableView Delegate & DataSource
extension HomeViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 85
  }
}

extension HomeViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dummyList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "memberCell") as! HomeTableViewCell
    
    let member = dummyList[indexPath.row]
    cell.nameLabel.text = member.name
    cell.stateLabel.text = member.state
    cell.profileImage.image = member.thumbnail
    
    cell.alertButton.backgroundColor = UIColor(named: "primaryRed")
    cell.alertButton.layer.cornerRadius = CGFloat(8)
    cell.messageButton.backgroundColor = UIColor(named: "primaryBlue")
    cell.messageButton.layer.cornerRadius = CGFloat(8)
    
    return cell
  }
}

// MARK: UISearchResultsUpdating
extension HomeViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    let searchWord = searchController.searchBar.text
    
    guard self.searchWord != searchWord else { return }
//    filtered = (searchWord?.isEmpty ?? true).negate
    
    tableView.reloadData()
  }
}
