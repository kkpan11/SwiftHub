//
//  CollectionViewController.swift
//  SwiftHub
//
//  Created by Khoren Markosyan on 1/4/17.
//  Copyright © 2017 Khoren Markosyan. All rights reserved.
//

import UIKit
import AMScrollingNavbar

class CollectionViewController: ViewController, UIScrollViewDelegate {

    lazy var collectionView: CollectionView = {
        let view = CollectionView()
        self.view.addSubview(view)
        view.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.topLayoutGuide.snp.bottom)
            make.bottom.equalTo(self.bottomLayoutGuide.snp.top)
        }
        return view
    }()

    var clearsSelectionOnViewWillAppear = true

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if clearsSelectionOnViewWillAppear == true {
            deselectSelectedItems()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Enable the navbar scrolling
        //        if let navigationController = self.navigationController as? ScrollingNavigationController {
        //            navigationController.followScrollView(collectionView, delay: 50.0)
        //        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let navigationController = navigationController as? ScrollingNavigationController {
            navigationController.showNavbar(animated: true)
        }
    }

    override func makeUI() {
        super.makeUI()

        _ = collectionView
    }

    override func updateUI() {
        super.updateUI()
    }
}

extension CollectionViewController {

    func deselectSelectedItems() {
        if let selectedIndexPaths = collectionView.indexPathsForSelectedItems {
            selectedIndexPaths.forEach({ (indexPath) in
                collectionView.deselectItem(at: indexPath, animated: false)
            })
        }
    }
}
