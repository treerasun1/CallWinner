//
//  LoginVC.swift
//  CallWinner
//
//  Created by tai on 23/3/2564 BE.
//

import UIKit
import GoogleSignIn
import FBSDKLoginKit

class LoginVC: UIViewController, UIScrollViewDelegate, LoginButtonDelegate, GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
      //  print("User Email :\(user.profile.email ?? "No. Email")")
        if (error == nil) {

               // perform your log in functions here...

               // ex. assign user profile data to variables
              // self.appUser.email = user.profile.email
             //  self.appUser.firstname = user.profile.givenName
            //   self.appUser.lastname = user.profile.familyName

               // etc.

               // Sign out of Google when logic completes for security purposes
              // GIDSignIn.sharedInstance().signOut()

           } else {
               print(error.localizedDescription)
           }
    }
    
    
   
    
  private let scrollView = UIScrollView()
    
 
    let signInButtonGoogle : GIDSignInButton = {
        let view = GIDSignInButton()
        return view
    }()
    
    
    lazy var FBbutton : UIButton = {
        let view = UIButton()
        view.backgroundColor = .white
        view.cornerRadius = 5
        view.setTitle("เข้าสู่ระบบด้วย Facebook", for: UIControl.State.normal)
        view.titleLabel?.font =
            UIFont.systemFont(ofSize: 16)
        view.setTitleColor(.black, for: .normal)
        let icon = UIImage(named: "facebook")!
        
        view.setImage(icon, for: .normal)
            view.imageView?.contentMode = .scaleAspectFit
        view.imageEdgeInsets = UIEdgeInsets(top: 0, left: view.frame.size.width-70, bottom: 0, right: 0)
        view.addTarget(self, action: #selector(handleCustomFBLogin(_:)), for: .touchUpInside)
        return view
    }()
    
    lazy var Googlebutton : UIButton = {
        let view = UIButton()
        view.backgroundColor = .white
        view.cornerRadius = 5
        view.setTitle("เข้าสู่ระบบด้วย Google", for: UIControl.State.normal)
        view.titleLabel?.font =
            UIFont.systemFont(ofSize: 16)
        view.setTitleColor(.black, for: .normal)
        let icon = UIImage(named: "google")!
        
        view.setImage(icon, for: .normal)
            view.imageView?.contentMode = .scaleAspectFit
        view.imageEdgeInsets = UIEdgeInsets(top: 0, left: view.frame.size.width-90, bottom: 0, right: 0)
        view.addTarget(self, action: #selector(handleCustomGoogleLogin(_:)), for: .touchUpInside)
        return view
    }()
    
    lazy var lbl : UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 16)
        view.attributedText = NSAttributedString(string: "ข้อกำหนด", attributes:
            [.underlineStyle: NSUnderlineStyle.single.rawValue])
        view.textColor = .red
        return view
    }()
    
    private let pageContor : UIPageControl = {
        let View = UIPageControl()
        View.numberOfPages = 3
        return View
    }()
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().delegate = self
        
      
      //  if GIDSignIn.sharedInstance()?.currentUser != nil
       // {
            
       // }
       // else
        //{
         //   GIDSignIn.sharedInstance()?.signIn()
       // }
        
      //  GIDSignIn.sharedInstance()?.presentingViewController = self
       
        view.addSubview(scrollView)
        view.addSubview(pageContor)
      //  view.addSubview(signInButtonGoogle)
        view.addSubview(Googlebutton)
        scrollView.backgroundColor = .white
        scrollView.delegate = self
        
     
        view.addSubview(FBbutton)
        view.addSubview(lbl)
        
        pageContor.addTarget(self, action: #selector(pageControlDidChanged(_:)), for: .valueChanged)
    }
    
    @objc func pageControlDidChanged(_ sender: UIPageControl)
    {
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x:CGFloat(current) * view.frame.size.width, y: 0), animated: true)
    }
    
   
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        FBbutton.frame = CGRect(x: 20, y: view.frame.size.height-110, width: view.frame.size.width-50, height: 45)
        
        
        lbl.frame = CGRect(x: view.frame.size.width / 2.4, y: view.frame.size.height-50, width: view.frame.size.width-50, height: 45)
        
       
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        
        Googlebutton.frame = CGRect(x: 20, y: view.frame.size.height-160, width: view.frame.size.width-50, height: 45)
        
        pageContor.frame = CGRect(x: 20, y: view.frame.size.height-210, width: view.frame.size.width-50, height: 45)
        

        if scrollView.subviews.count == 2
        {
            configureScrollView()
        }
        
    }
  

    private func configureScrollView()
    {
        scrollView.contentSize = CGSize(width: view.frame.size.width * 3, height: view.frame.size.height)
        scrollView.isPagingEnabled = true
       
        
        for x in 0..<3 {
            var page = UIView()
            if(x == 0)
            {
                page = LoginPage1(frame: CGRect(x: CGFloat(x) * view.frame.size.width, y: 0, width: view.frame.size.width,height: scrollView.frame.size.height))
            }
            else if(x == 1)
            {
                 page = LoginPage2(frame: CGRect(x: CGFloat(x) * view.frame.size.width, y: 0, width: view.frame.size.width,height: scrollView.frame.size.height))
            }
            else if(x == 2)
            {
                page = LoginPage3(frame: CGRect(x: CGFloat(x) * view.frame.size.width, y: 0, width: view.frame.size.width,height: scrollView.frame.size.height))
            }
         
            
            scrollView.addSubview(page)
        }
    }
    
    @objc func handleCustomFBLogin(_:UIButton)
    {
        let manager = LoginManager()
        manager.logIn(permissions: [.publicProfile], viewController: self) { (result) in
            switch result {
            case .success:
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
                  
                }
            default:
                break
            }
            
        }
       
    }
    
    @objc func handleCustomGoogleLogin(_:UIButton)
    {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.signIn()
       
    }
    
    

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageContor.currentPage = Int(Float(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
    
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

