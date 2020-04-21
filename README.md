# ios_view_study

Project 개요

`- ios_custom_view : ViewController로 Component 만들기`
=============

1. Create file with `Cocoatouch` and `xib` 
2. Design your component
3. ❗️Especially, don't forget to set your view as `freeform` 
4. Add your component on whatever main view you want to add to 

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




`- ios_custom_view_second : UIView로 Component 만들기`
=============

참고자료 : https://guides.codepath.com/ios/Custom-Views-Quickstart

1. Create file with `Cocoatocuh` for `UIView` and `xib`
2. Design Your component
3. ❗️ Set your view as `freeform` to customize your view
4. ❗️❗️❗️ Make the `File's Owner` to Your Custom Class (UI View Here)
5.  Write your code to initialize it

            import UIKit

            class CustomView: UIView {

                @IBOutlet var contentView: UIView!
                
                @IBOutlet weak var textField: UITextField!
                @IBOutlet weak var textView: UITextView!
                @IBOutlet weak var button: UIButton!

                override init(frame: CGRect) {
                    super.init(frame: frame)
                    commonInit()
                }
                
                required init?(coder: NSCoder) {
                    super.init(coder: coder)
                    commonInit()
               
                }
                
                func commonInit() {
                    let nib = UINib(nibName: "CustomView", bundle: nil)
                    nib.instantiate(withOwner: self, options: nil)
                    contentView.frame = bounds
                    addSubview(contentView)
                }

            }


Swift Slide Show
=============

            //
            //  ViewController.swift
            //  swift_slide_show
            //
            //  Created by shin seunghyun on 2020/03/30.
            //  Copyright © 2020 shin seunghyun. All rights reserved.
            //
            
            import UIKit
            
            class ViewController: UIViewController {
            
                let imgArr = [ #imageLiteral(resourceName: "image1") , #imageLiteral(resourceName: "image2") , #imageLiteral(resourceName: "image3") ]
                
                @IBOutlet weak var collectionView: UICollectionView!
                @IBOutlet weak var pageController: UIPageControl!
                
                override func viewDidLoad() {
                    super.viewDidLoad()
                    collectionView.delegate = self
                    collectionView.dataSource = self
                    
                    pageController.numberOfPages = imgArr.count
                    pageController.currentPage = 0
                    
                }
                
            
            }
            
            extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
                
                func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                    return imgArr.count
                }
                
                func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                   
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
                    cell.imageView.image = imgArr[indexPath.row]
            //        pageController.currentPage = indexPath.row
                    
                    return cell
                    
                }
                
                func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
                    let page = Int(targetContentOffset.pointee.x / collectionView.frame.width)
                    pageController.currentPage = page
                    
                }
                
                
            }
            
            extension ViewController: UICollectionViewDelegateFlowLayout {
                //Margin 값을 정해줌
                func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
                    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                }
                
                //Layout 사이즈를 정해줌
                func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                    let size = collectionView.frame.size
                    return CGSize(width: size.width, height: size.height)
                }
                
                //Spacing 조절
                func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
                    return 0.0
                }
                
                //Spacing 조절
                func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
                    return 0.0
                }
            }
            
            class MyCell: UICollectionViewCell {
                @IBOutlet weak var imageView: UIImageView!
            }


Segmented Control - MasterviewController which contains child view controllers
=============


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

i. Child ViewController들을 가져온다.

        - Child를 Parent에 추가

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

i-1

            private func addViewControllerAsChildViewController(childViewController: UIViewController){
                    self.addChild(childViewController)
                    view.addSubview(childViewController.view)
                    childViewController.view.frame = view.bounds
                    childViewController.view.autoresizingMask = [.flexibleWidth , .flexibleHeight]
                    childViewController.didMove(toParent: self)
                }

ii. 기본적인 setup Segment를 initialize

            private func setupSegmentedControl(){
                  segmentedControl.removeAllSegments()
                  segmentedControl.insertSegment(withTitle: "Summary", at: 0, animated: false)
                  segmentedControl.insertSegment(withTitle: "Sessions", at: 1, animated: false)
                  segmentedControl.addTarget(self, action: #selector(selectionDidChange(sender:)), for: .valueChanged)
                  segmentedControl.selectedSegmentIndex = 0
            }

iii. segment index에 따라서 화면을 rendering 해주게 설정

            private func updateView(){
                summaryViewController.view.isHidden = !(segmentedControl.selectedSegmentIndex == 0)
                sessionsViewController.view.isHidden = (segmentedControl.selectedSegmentIndex == 0)
            }


Custom AlertView
=============

- 참고만 함, ios 13.4에서는 똑같은 코드로 해도 안됨.





# Collection View 정리 

### 🔷 고정되지 않은 크기

### Pinterest Style CollectionViewCell
- **estimated size: automatic**

### 🔷고정된 크기 - 공통

- imageView, equal width, equal height, horizontal center, vertical center
- 그냥 constraint로 top right bottom left 다 맞춰줘도 된다.
- **estimated size : none**

### Full Size CollectionView Cell 만들기

       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let size = collectionView.frame.size //* 이 부분
            return CGSize(width: size.width, height: size.height)
        }

    extension ViewController: UICollectionViewDelegateFlowLayout {
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let size = collectionView.frame.size //* 이 부분
            return CGSize(width: size.width, height: size.height)
        }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0.0
        }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0.0
        }
        
    }

### 3분의 1의 크기 또는 5분의 1의 크기로 각각의 cell을 맞춰주기

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width: CGFloat = collectionView.frame.width / 3 - 1
            return CGSize(width: width, height: width)
        }

    extension ViewController: UICollectionViewDelegateFlowLayout {
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            let width: CGFloat = collectionView.frame.width / 3 - 1
            
            return CGSize(width: width, height: width)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 1.0
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            1.0
        }
        
    }

### CollectionView의 크기가 cell의 사이즈만큼 늘어나게 하기

    - collection view의 height constraint를 가져온다.
    - constraint height 사이즈를 가져오면 dynamic하게 못한다고 생각할 수 있지만 어차피 코드로 맞춰줘서 상관이 없다.

        override func viewDidLayoutSubviews() {
            collectionViewHeight.constant = collectionView.contentSize.height
        }
