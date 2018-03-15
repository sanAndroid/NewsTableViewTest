//
//  NewPasswordViewController.swift
//  NewsTableViewTest
//
//  Created by pau on 3/14/18.
//  Copyright © 2018 pau. All rights reserved.
//

import UIKit

class NewPasswordViewController: UIViewController {


    @IBOutlet weak var pwdField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor =  UIColor.black.withAlphaComponent(0.8)
        self.showAnimate()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func updatePassword(_ sender: UIButton) {
        if pwdField?.text != nil {
            if (pwdField.text == "1912" || pwdField.text == "C1602Z") {
                UserDefaults.standard.set(pwdField.text, forKey: "HelmholtzPWD")
                self.removeAnimate()
            } else {
                showToast(message: "Ungültig!")
            }
        }
    }
    
    func showAnimate(){
        self.view.transform = CGAffineTransform(scaleX: 1.3,y: 1.3)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.3, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.3,y: 1.3)
            }
        )
    }
    
    func removeAnimate(){
        UIView.animate(withDuration: 0.3, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3,y: 1.3)
            self.view.alpha = 0.0
        },completion: {(finished: Bool) in
            if (finished) {
                self.view.removeFromSuperview()
            }
        }
        )
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func showToast(message : String) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.width/2  - 120, y: self.view.frame.size.height-425, width: 150, height: 80))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }

}
