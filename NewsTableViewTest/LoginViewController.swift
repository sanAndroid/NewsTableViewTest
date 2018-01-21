//
//  LoginViewController.swift
//  NewsTableViewTest
//
//  Created by pau on 1/19/18.
//  Copyright © 2018 pau. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {


    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        if let pwd =  UserDefaults.standard.string(forKey: "HelmholtzPWD"){
            print("Key exists: " + pwd)
            if pwd == "1912"{
                print("Show is called: ")
                performSegue(withIdentifier: "loadTabBar", sender:self)
            }
        }
    }


        // Do any additional setup after loading the view.

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkPwd(_ sender: Any) {
        
        guard let pwd = password.text else{
            print("No password")
            return
        }
        print("Password: " + pwd)
        if pwd == "1912" {
            print("Password richtig")
            // Open tabbar // UITabBarController
            UserDefaults.standard.set("1912", forKey: "HelmholtzPWD")
            //UserDefaults.standard.set(DB.accountName, forKey: "TeacherUID")
            self.show(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabbar"), sender: self)
        }
    }
   
    
    /*
    @IBAction func checkLogin(_ sender: UIButton) {
     

         */
            
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
