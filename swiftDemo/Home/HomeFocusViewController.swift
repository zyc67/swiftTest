//
//  HomeFocusViewController.swift
//  swiftDemo
//
//  Created by weather on 2023/8/10.
//

import UIKit
import JXSegmentedView

class HomeFocusViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       navigationHide = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HomeFocusViewController: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
}