//
//  ProfileViewController.swift
//  Moltaqa_Task
//
//  Created by Oday Dieg on 25/10/2022.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var headerContainerView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var profileImageContainerView: UIView!
    @IBOutlet weak var secondConatinerViewOfImage: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var jobTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        disableTextField()
        setupHeaderView()
    }
    
    private func setupHeaderView(){
        profileImageContainerView.layer.cornerRadius                = profileImageContainerView.frame.width / 2
        profileImage.layer.cornerRadius                             = profileImage.frame.width / 2
        secondConatinerViewOfImage.layer.cornerRadius               = secondConatinerViewOfImage.frame.width / 2
        headerContainerView.layer.cornerRadius                      = 8
        headerContainerView.layer.maskedCorners                     = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    private func  disableTextField(){
        let textFields = [emailTextField,phoneTextField,locationTextField,jobTextField]
        for everText in textFields{
            everText?.isUserInteractionEnabled = false
        }
    }
    


    @IBAction func backBtnPRessed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}


//MARK: - API request

extension ProfileViewController {
    
    
//    private func getSpecificUser()
//    {
//
//        self.lock()
//        ApiManager.instance.getPosts(methodType: .get, parameters: nil, url: ServiceUrl.specific_user) {
//            (Model: BaseModel<UserData>? , err : String? )in
//            self.unlock()
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
//    }
//
//        }
//
//}

}
