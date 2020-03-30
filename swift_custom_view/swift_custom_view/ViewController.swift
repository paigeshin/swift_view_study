//
//  ViewController.swift
//  swift_custom_view
//
//  Created by shin seunghyun on 2020/03/30.
//  Copyright © 2020 shin seunghyun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addProfileHeaderTo(viewController: self)
        
    }
    
    //Main View 밖에서 `xib`로 만들어 놓은 Component를 가져온다.
    func addProfileHeaderTo(viewController: UIViewController) {
        let profileHeader: ProfileHeaderViewController = ProfileHeaderViewController(nibName: "ProfileHeaderViewController", bundle: nil)
        viewController.view.addSubview(profileHeader.view)
    }


}

