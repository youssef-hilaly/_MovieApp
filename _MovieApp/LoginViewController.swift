//
//  LoginViewController.swift
//  _MovieApp
//
//  Created by Youssef Hilaly on 27/01/1401 AP.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var PasswordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func loginBtnAction(_ sender: Any) {
        let username = userNameTF.text
        let password = PasswordTF.text
        let _valid = verifyUser(username: username, password: password)
        
        if(_valid){
            
            let userDefaluts = UserDefaults.standard
            userDefaluts.set(true, forKey: "LoginState")
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MoviesListVC") as! ViewController
            let scene = self.view.window?.windowScene?.delegate as! SceneDelegate
            scene.window!.rootViewController = UINavigationController(rootViewController: vc)
        }
    }
    
    func verifyUser(username:String? ,password:String?) -> Bool{
        if (username == "ahmed" && password == "123456"){
            return true
        }
        else{
            return false
        }
    }
}
