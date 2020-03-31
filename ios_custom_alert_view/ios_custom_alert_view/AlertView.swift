//
//  AlertView.swift
//  ios_custom_alert_view
//
//  Created by shin seunghyun on 2020/03/31.
//  Copyright © 2020 shin seunghyun. All rights reserved.
//

import Foundation
import UIKit

class AlertView: UIView {
    
    static let instance = AlertView()
    
    @IBOutlet weak var alertParentView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("AlertView", owner: self, options: nil)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        imgView.layer.cornerRadius = imgView.frame.width / 2
        
        alertParentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        alertParentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    enum AlertType {
        case success
        case failure
    }
    
    func showAlert(title: String, message: String, alertType: AlertType){
        titleLabel.text = title
        messageLabel.text = message
        
        switch alertType  {
        case .success:
            imgView.image = UIImage(named: "success")
        case .failure:
            imgView.image = UIImage(named: "failure")
        }
        
        //어떤 View에서도 화면을 rendering 하게 해준다.
        UIApplication.shared.keyWindow?.addSubview(alertParentView)
        
    }
    
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        alertParentView.removeFromSuperview()
    }
    
}
