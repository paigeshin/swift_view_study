# ios_view_study

Project 개요

1. Create file with `Cocoatouch` and `xib` 
2. Design your component
3. ❗️Especially, don't forget to set your view as `freeform` 
4. Add your component on whatever main view you want to 

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
