//
//  changeStatusViewController.swift
//  Moltaqa_Task
//
//  Created by Oday Dieg on 25/10/2022.
//

import UIKit



protocol changeStatusDelegate{
    func UserStatus(is status: String)
}

class changeStatusViewController: UIViewController {
    
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var busyBtn: UIButton!
    @IBOutlet weak var meetingBtn: UIButton!
    @IBOutlet weak var avilableBtn: UIButton!
    @IBOutlet weak var urgentCallBtn: UIButton!
    @IBOutlet weak var statusTextField: UITextField!
    @IBOutlet weak var confirmBtn: UIButton!
    
    var delegate:changeStatusDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewsRadius()
        setupTextField()
        listenToKeyboard()
        setupBtnInInitialState()
    }
    
    private func setupViewsRadius(){
        let views = [containerView,busyBtn,meetingBtn,avilableBtn,urgentCallBtn,confirmBtn]
        for everyView in views {
            everyView?.layer.cornerRadius    = 8
        }
    }
    private func setupTextField(){
        statusTextField.delegate = self
        statusTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    private func setupBtnInInitialState(){
        confirmBtn.alpha                = 0.5
        confirmBtn.isEnabled            = false
        confirmBtn.setTitleColor(.white, for: .normal)
        
    }
    
    private func listenToKeyboard(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowInLogin), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func textFieldDidChange(){
        let text                    = statusTextField.text ?? ""
        if text != ""{
            confirmBtn.alpha       = 1
            confirmBtn.isEnabled   = true
        }else{
            confirmBtn.alpha       = 0.5
        }
        
    }
    
    @IBAction func emptySpaceBtnPRessed(_ sender: Any) {
        self.dismiss(animated: false)
        
    }
    
    @IBAction func busyBtnPressed(_ sender: UIButton) {
        
        self.dismiss(animated: false){ [weak self] in
            guard let self else {return}
            self.delegate?.UserStatus(is: sender.titleLabel?.text ?? "")
        }
    }
    
    @IBAction func inMeetingBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: false){ [weak self] in
            guard let self else {return}
            self.delegate?.UserStatus(is: sender.titleLabel?.text ?? "")
        }
    }
    @IBAction func abilableBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: false){ [weak self] in
            guard let self else {return}
            self.delegate?.UserStatus(is: sender.titleLabel?.text ?? "")
        }
        
    }
    
    @IBAction func urgentCallBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: false){ [weak self] in
            guard let self else {return}
            self.delegate?.UserStatus(is: sender.titleLabel?.text ?? "")
        }
    }
    
    @IBAction func confirmBtnPressed(_ sender: Any) {
        self.dismiss(animated: false){ [weak self] in
            guard let self else {return}
            self.delegate?.UserStatus(is: self.statusTextField.text ?? "")
        }
    }
    
}


extension changeStatusViewController:UITextFieldDelegate {
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
}
