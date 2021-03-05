//
//  MessageViewController.swift
//  FamilyApp
//
//  Created by KEEN on 2021/03/05.
//

import UIKit

class MessageViewController: UIViewController {
  
  // TODO : 매세지 목록 탭 화면 구성하기
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
}

extension MessageViewController: UITableViewDelegate {
  func tableView(
    _ tableView: UITableView,
    heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 85
  }
}

extension MessageViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell") as! MessageTableViewCell
    return cell
  }
  
  
}
