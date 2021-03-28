//
//  LoginPage1.swift
//  CallWinner
//
//  Created by tai on 23/3/2564 BE.
//

import  UIKit


class LoginPage3: UIView{

   
    let lbl : UILabel = {
        let label = UILabel()
        label.text = "ออกจากบ้านเป็นเรื่องง่าย"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lbl1 : UILabel = {
        let label = UILabel()
        label.text = "เพียงแค่ใช้แอพนี้"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lbl2 : UILabel = {
        let label = UILabel()
        label.text = "แค่คลิกเดียว เราจะมารับคุณถึงที่"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    
    let logoImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Group 17")
        return imageView
    }()
    
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = UIColor.AppColor.background_Green
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
        
   
        
        addSubview(logoImage)
        addConstraintsWithFormat("V:[v0(149)]", views: logoImage)
               addConstraintsWithFormat("H:|-0-[v0]-170-|", views: logoImage)
        //logoImage.topAnchor.constraint(equalTo: lbl3.bottomAnchor,constant: 5).isActive = true
        logoImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        logoImage.centerYAnchor.constraint(equalTo: centerYAnchor,constant: -37).isActive = true

    }
    
 
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
}

