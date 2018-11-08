//
//  LoginAccountViewController.swift
//  LoginFB
//
//  Created by Germán Santos Jaimes on 11/7/18.
//  Copyright © 2018 Germán Santos Jaimes. All rights reserved.
//

import UIKit
import Firebase
class LoginAccountViewController: UIViewController {

    @IBOutlet weak var nombre: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        checkIfUserIsLoggedIn()
    }
    
    
    @IBAction func logoutUser(_ sender: UIButton) {
        //navigationController?.popViewController(animated: true)
        handleLogout()
    }
    
    func checkIfUserIsLoggedIn() {
        
        if Auth.auth().currentUser?.uid == nil{
            
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
            
        }else{
            //fetchUser()
        }
    }
    
    @objc func handleLogout(){
        do {
            try Auth.auth().signOut()
        } catch let  logoutError  {
            print(logoutError)
        }
         self.performSegue(withIdentifier: "toLoginVc", sender: nil )
    }
    
}
