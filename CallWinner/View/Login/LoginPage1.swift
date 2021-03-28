//
//  LoginPage1.swift
//  CallWinner
//
//  Created by tai on 23/3/2564 BE.
//

import  UIKit


class LoginPage1: UIView{

   
    let lbl : UILabel = {
        let label = UILabel()
        label.text = "ไม่ต้องโทรตาม"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lbl1 : UILabel = {
        let label = UILabel()
        label.text = "ไม่ต้องยอกมือเรียก"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lbl2 : UILabel = {
        let label = UILabel()
        label.text = "ไม่ต้องรอนานแสนนาน"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lbl3 : UILabel = {
        let label = UILabel()
        label.text = "ไม่ต้องยืดตากแดด"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let logoImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Group 15")
        return imageView
    }()
    
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = UIColor.AppColor.background_Orange
       // GIDSignIn.sharedInstance()?.presentingViewController = self
       
        
        
        addSubview(lbl)
        addConstraintsWithFormat("V:[v0(30)]", views: lbl)
               addConstraintsWithFormat("H:|-20-[v0]-30-|", views: lbl)
       lbl.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 60).isActive = true

        addSubview(lbl1)
        addConstraintsWithFormat("V:[v0(20)]", views: lbl1)
               addConstraintsWithFormat("H:|-20-[v0]-30-|", views: lbl1)
        lbl1.topAnchor.constraint(equalTo: lbl.bottomAnchor,constant: 10).isActive = true
      
        
        addSubview(lbl2)
        addConstraintsWithFormat("V:[v0(20)]", views: lbl2)
               addConstraintsWithFormat("H:|-20-[v0]-30-|", views: lbl2)
        lbl2.topAnchor.constraint(equalTo: lbl1.bottomAnchor,constant: 5).isActive = true
        
        addSubview(lbl3)
        addConstraintsWithFormat("V:[v0(20)]", views: lbl3)
               addConstraintsWithFormat("H:|-20-[v0]-30-|", views: lbl3)
        lbl3.topAnchor.constraint(equalTo: lbl2.bottomAnchor,constant: 5).isActive = true
        
        addSubview(logoImage)
        addConstraintsWithFormat("V:[v0(200)]", views: logoImage)
               addConstraintsWithFormat("H:|[v0]|", views: logoImage)
        //logoImage.topAnchor.constraint(equalTo: lbl3.bottomAnchor,constant: 5).isActive = true
        logoImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        logoImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

    }
    
 
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
}
