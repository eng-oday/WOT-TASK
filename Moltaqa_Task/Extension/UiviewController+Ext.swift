//
//  UIViewController+Ext.swift
//  AuthFlow-3rpApp
//
//  Created by Oday Dieg on 03/07/2022.
//

import Foundation
import SVProgressHUD
import NVActivityIndicatorView
import AJMessage
import CoreImage
import UIKit

extension UIViewController{

    enum Vibration {
        case error
        case success
        func vibrate() {
            switch self {
            case .error:
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.error)
                
            case .success:
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.success)
                
            }
    }
    }

    func showAlertWithTitle(title: String, message: String, type: Vibration) {
        
        if type == .error {
            AJMessage(title: title, message: message , status : .error ).show()
            
          //  self.navigationController?.view.makeToast(message)
            
        }else if type == .success {
            AJMessage(title: title, message: message , status : .success).show()
           // self.navigationController?.view.makeToast(message , position: .top)
        }
        
    }
    
    func lock(frameRect: CGRect = CGRect.zero) {
        let activityIndicatorView = NVActivityIndicatorView(frame: .init(x: 0, y: 0, width: 50, height: 50), type: .ballClipRotateMultiple, color: UIColor.systemBlue, padding: .zero)
        view.addSubview(activityIndicatorView)
        view.isUserInteractionEnabled = false
        activityIndicatorView.center = self.view.center
        activityIndicatorView.startAnimating()
       
    }
    
    func unlock() {
        DispatchQueue.main.async {
            if let indicator = self.view.subviews.first(where: {$0 is NVActivityIndicatorView }) as? NVActivityIndicatorView {
                indicator.stopAnimating()
                self.view.isUserInteractionEnabled = true
                indicator.removeFromSuperview()
            }
        }
    }
    
    func convertIsoStringToCustomDateString(_ string:String?) ->String{
        let isoDate = string ?? ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSS'Z'"
        let date = dateFormatter.date(from:isoDate)!
        dateFormatter.dateFormat = "MMM ,dd YYYY"
        return dateFormatter.string(from: date)
    }
    
 
    @objc func keyboardWillShowInLogin(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height - (keyboardSize.height - 95)
            }
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height - (keyboardSize.height - 20)
            }
        }
    }


    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }

    func blurEffect(ONImage bg:UIImage , context:CIContext) -> UIImage {

        let currentFilter = CIFilter(name: "CIGaussianBlur")
        let beginImage = CIImage(image: bg)
        currentFilter!.setValue(beginImage, forKey: kCIInputImageKey)
        currentFilter!.setValue(10, forKey: kCIInputRadiusKey)

        let cropFilter = CIFilter(name: "CICrop")
        cropFilter!.setValue(currentFilter!.outputImage, forKey: kCIInputImageKey)
        cropFilter!.setValue(CIVector(cgRect: beginImage!.extent), forKey: "inputRectangle")

        let output = cropFilter!.outputImage
        let cgimg = context.createCGImage(output!, from: output!.extent)
        let processedImage = UIImage(cgImage: cgimg!)
        return processedImage
    }
    
    func presentHalfScreenSheet<T:UIViewController>(viewController:T.Type, storyboardName:String){
        
        guard let nextViewController = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: String(describing: T.self)) as? T else { return }
        if #available(iOS 15.0, *) {
            if let presentationController = nextViewController.presentationController as? UISheetPresentationController {
                presentationController.detents = [.medium()] /// change to [.medium(), .large()] for a half *and* full screen sheet
            }
        } else {
            // Fallback on earlier versions
        }
        self.present(nextViewController, animated: true)
    }
    

    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

