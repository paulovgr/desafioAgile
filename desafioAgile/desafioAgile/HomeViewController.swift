//
//  ViewController.swift
//  desafioAgile
//
//  Created by Paulo Victor Guimaraes Rosa on 10/07/21.
//

import UIKit

class HomeViewController: UIViewController {

    private var homeView = HomeView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view = homeView
        homeView.getButton().addTarget(self, action: #selector(resultTap), for: .touchUpInside)

    }

    @objc func resultTap() {
        print("oi")
      //w  self.navigationController?.pushViewController(view, animated: true)
    }
}

