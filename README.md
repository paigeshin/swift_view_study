# ios_view_study

Project 개요

`- ios_custom_view : ViewController로 Component 만들기`

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
