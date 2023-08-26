//
//  HomeHotViewController.swift
//  swiftDemo
//
//  Created by weather on 2023/8/10.
//

import UIKit
import JXSegmentedView
import SwiftyRSA
import SwiftyJSON

class HomeHotViewController: BaseViewController {
    
    var page: Int! = 0
    var timeStamp: CLongLong! = 0
    
    var header: RefreshHeader!
    var footer: RefreshFooter!
    
    var dataSource: [HomeListModel]? = []
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIDevice.kScreenWidth, height: UIDevice.kScreenHeight - UIDevice.navigationFullHeight - UIDevice.tabbarFullHeight), style: .plain)
//        tableView.backgroundColor = .red
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
//        tableView.separatorStyle = .none
        tableView.register(HomeDiaryCell.self, forCellReuseIdentifier: "HomeDiaryCell")
        view.addSubview(tableView)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationHide = true
      
        header = RefreshHeader(refreshingBlock: { [weak self] in
            self?.loadNewData()
        })
        tableView.mj_header = header
        header?.beginRefreshing()

        footer = RefreshFooter(refreshingBlock: { [weak self] in
            self?.loadMoreData()
        })
        tableView.mj_footer = footer
        tableView.mj_footer?.isHidden = true
    }
    
    
    func loadNewData() {
        page = 0
        timeStamp = Date().timeStamp
        loadHomeListData()
    }
    
    func loadMoreData() {
        page += 1
        loadHomeListData()
    }
    
    func loadHomeListData() {
        NetWorkAPI.diaryScrapList(page: page, orderType: 1, order: 1, key: "", itemId: "", curTime: timeStamp) { [weak self] data in
            let json = JSON(data)
            let code = json["return_code"].intValue
            if (code == 1) {
                if self?.page == 0 {
                    self?.dataSource?.removeAll()
                }
                let arrayModel = json["data"].arrayValue.map({HomeListModel(jsonData: $0)})
                self?.dataSource?.append(contentsOf: arrayModel)
                self?.tableView.reloadData()
                
                self?.tableView.mj_header?.endRefreshing()
                if arrayModel.isEmpty {
                    self?.tableView.mj_footer?.endRefreshingWithNoMoreData()
                } else {
                    self?.tableView.mj_footer?.endRefreshing()
                }
                self?.tableView.mj_footer?.isHidden = false
            }
        } failure: { [weak self] error in
            ZYCLog(error)
            self?.tableView.mj_header?.endRefreshing()
            self?.tableView.mj_footer?.endRefreshing()
            self?.tableView.mj_footer?.isHidden = self?.dataSource?.count ?? 0 == 0
        }
    }
}


extension HomeHotViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeDiaryCell", for: indexPath) as? HomeDiaryCell
        let model: HomeListModel? = self.dataSource?[indexPath.row]
        cell?.model = model
        return cell!
    }
}

extension HomeHotViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


func testUserInfo() {
//    var userInfo: UserInfo? = unarchiverData(fileName: "userInfo.data")
//    UserManager.shared.user = userInfo
//    ZYCLog(userInfo)
    do {
        let clear = try ClearMessage(string: "654321", using: .utf8)
        let encrypted = try clear.encrypted(with: try PublicKey(base64Encoded: RSAPublickKey), padding: .PKCS1)
        let base64String = encrypted.base64String

        NetWorkAPI.accountLogin(loginType: 1, account: "13122897525", password: base64String, msgCode: "", isTeenagerMode: 0) { data in
            let json = JSON(data)
            let code = json["code"].intValue
            if (code == 1) {
                let user = User(jsonData: json["data"]["data"])
                archivedData(model: user, fileName: "userInfo.data")

                var userInfo: User? = unarchiverData(fileName: "userInfo.data")
                ZYCLog(userInfo)
            }
        } failure: { error in

        }
    } catch {

    }
}

extension HomeHotViewController: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
}
