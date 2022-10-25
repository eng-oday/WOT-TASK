//
//  LoginViewController.swift
//  Moltaqa_Task
//
//  Created by Oday Dieg on 25/10/2022.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var organizationContainerView: UIView!
    @IBOutlet weak var organizationTextField: UITextField!
    @IBOutlet weak var usernameContainerView: UIView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButtonContainerView: UIView!
    private var views:[UIView]              = []
    private var textField:[UITextField]     = []
    private let organizationData            = "moltaqa"
    private let userNameData                = "oday"
    private let passwordData                = "1234"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        setupViewControllerUIRadius()
        setupTextFieldPlaceHolderAndDelegate()
        listenToKeyboard()
    }
    
    private func listenToKeyboard(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowInLogin), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func setupViewControllerUIRadius(){
       views =   [organizationContainerView,usernameContainerView,passwordContainerView,loginButtonContainerView]
        
        for everyView in views {
            everyView.layer.cornerRadius   = 8
            everyView.layer.masksToBounds  = true
        }
    }

    
    private func setupTextFieldPlaceHolderAndDelegate(){
        textField = [organizationTextField,userNameTextField,passwordTextField]
        for everTextField in textField{
            everTextField.delegate = self
        }
        
        guard let font =  UIFont(name: "Palatino-Bold", size: 16) else {return}
        
        organizationTextField.attributedPlaceholder = NSAttributedString(
            string: "Organization", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray,NSAttributedString.Key.font:font]
        )
        userNameTextField.attributedPlaceholder = NSAttributedString(
            string: "User Name", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray,NSAttributedString.Key.font:font]
        )
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray,NSAttributedString.Key.font:font]
        )
    }
    
    private func getDataEnteredByUserAndCheck()->Bool{
        let organization = organizationTextField.text
        let userName     = userNameTextField.text
        let password     = passwordTextField.text
        
        if organizationData == organization && userNameData == userName && passwordData == password {
            return true
        }else{
            self.showAlertWithTitle(title: "", message: "there is field entered Wrong...!", type: .error)
            return false
        }
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        if getDataEnteredByUserAndCheck() {
            // Must call api and Go Home
            Helper.skipAndGoToHome()
        }
    }
        

}



extension LoginViewController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}




//MARK: - Login Service

extension LoginViewController{
    
//    private func Login(userName:String,Password:String,organization:String)
//    {
//        let param = [
//            "organization":organization,
//            "username": userName,
//            "password": Password
//        ] as! [String:AnyObject]
//
//        ApiManager.instance.getPosts(methodType: .post, parameters: param, url: ServiceUrl.login) {
//            (Model: BaseModel<UserData>? , err : String? )in
//
//                        if  err != nil {
//
//                            //  Completion(nil,"noNet")
//                            if err == "noNet" {
//                                // self.show_NoDataView(View: self.view)
//                                print("----------------->No net")
//
//                            }else if err == "anError" {
//                                //  self.show_AnErrorView(View: self.view)
//                                print("an errrrorrrrrrrrrrrr")
//                            }else {
//                                self.showAlertWithTitle(title: "", message: err ?? "", type: .error)
//                            }
//
//                        }else {
//                            guard let model = Model?.data else{return}
//                            print(model)
//                            UserAuthService.userData = model
//                            Helper.restartApp()
//
//    }
//
//        }
//
//}

    
}
