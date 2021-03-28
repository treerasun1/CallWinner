//
//  ViewController.swift
//  CallWinner
//
//  Created by tai on 23/3/2564 BE.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController,LoginButtonDelegate{
    let signInButtonFackbook = FBLoginButton()
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let token = AccessToken.current, !token.isExpired {
            // User is logged in, do work such as go to next view controller.
            
            let token = token.tokenString
            
            let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["firlds": "email, name"], tokenString: token, version: nil, httpMethod: .get)
            
            request.start(completionHandler: {connection,result,error in
                print(result)
            })
        }
        else
        {
            signInButtonFackbook.center = view.center
            signInButtonFackbook.delegate = self
            signInButtonFackbook.permissions = ["public_profile", "email"]
            view.addSubview(signInButtonFackbook)
        }
     
        // Do any additional setup after loading the view.
    }
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        let token = result?.token?.tokenString
        
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["firlds": "email, name"], tokenString: token, version: nil, httpMethod: .get)
        
        request.start(completionHandler: {connection,result,error in
            print(result)
        })
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
    }
    


}

