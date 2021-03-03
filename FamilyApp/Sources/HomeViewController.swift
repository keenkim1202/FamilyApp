//
//  HomeViewController.swift
//  FamilyApp
//
//  Created by KEEN on 2021/02/27.
//

import UIKit

class HomeViewController: UIViewController {
  
  var memberType: Member?
  
  var dummyList: [Member] = [
    Member(name: "kate", state: "공부중", thumbnail: UIImage(named: "defaultProfile")),
    Member(name: "keen", state: "휴식중", thumbnail: UIImage(named: "defaultProfile"))]
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var searchBar: UISearchBar!
  
  override func viewDidLoad() {
    super.viewDidLoad()
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

// MARK: SearchBar Delegate
extension HomeViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    searchBar.endEditing(true)
  }
//  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
//    searchBar.endEditing(true)
//  }

}

