//
//  ProfileHeaderViewController.swift
//  swift_custom_view
//
//  Created by shin seunghyun on 2020/03/30.
//  Copyright © 2020 shin seunghyun. All rights reserved.
//

import UIKit

class ProfileHeaderViewController: UIViewController {

    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var btnEditProfile: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imgAvatar.backgroundColor = .white
        imgAvatar.layer.cornerRadius = imgAvatar.frame.width / 2
        btnEditProfile.backgroundColor = .white
        btnEditProfile.layer.cornerRadius = 5.0
    }
    
    @IBAction func editProfileButtonPressed(_ sender: UIButton) {
        print("Edit profile button is tapped")
    }

}
