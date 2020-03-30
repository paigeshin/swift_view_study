//
//  ViewController.swift
//  ManagingViewControllers
//
//  Created by shin seunghyun on 2020/03/30.
//  Copyright © 2020 shin seunghyun. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    //함수를 실행하고 결과값을 받아옴.
    lazy var summaryViewController: SummaryViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "SummaryViewController") as! SummaryViewController
        addViewControllerAsChildViewController(childViewController: viewController)
        return viewController
    }()
    
    lazy var sessionsViewController: SessionsViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "SessionsViewController") as! SessionsViewController
        addViewControllerAsChildViewController(childViewController: viewController)
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // View Methods
    private func setupView(){
        setupSegmentedControl()
        updateView()
    }
    
    private func setupSegmentedControl(){
        segmentedControl.removeAllSegments()
        segmentedControl.insertSegment(withTitle: "Summary", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "Sessions", at: 1, animated: false)
        segmentedControl.addTarget(self, action: #selector(selectionDidChange(sender:)), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
    }
    
    @objc func selectionDidChange(sender: UISegmentedControl) {
        updateView()
    }
    
    private func updateView(){
        summaryViewController.view.isHidden = !(segmentedControl.selectedSegmentIndex == 0)
        sessionsViewController.view.isHidden = (segmentedControl.selectedSegmentIndex == 0)
    }
    
    private func addViewControllerAsChildViewController(childViewController: UIViewController){
        self.addChild(childViewController)
        view.addSubview(childViewController.view)
        childViewController.view.frame = view.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth , .flexibleHeight]
        childViewController.didMove(toParent: self)
    }
    
    //나중에 쓸 때
    private func removeViewControllerAsChildViewController(childViewController: UIViewController) {
        childViewController.willMove(toParent: nil)
        childViewController.view.removeFromSuperview()
        childViewController.removeFromParent()
    }


}


