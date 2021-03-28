//
//  LoginPage1.swift
//  CallWinner
//
//  Created by tai on 23/3/2564 BE.
//

import  UIKit


class LoginPage2: UIView{


    let lbl : UILabel = {
        let label = UILabel()
        label.text = "ด้วยความใส่ใจในชุมชน"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lbl1 : UILabel = {
        let label = UILabel()
        label.text = "ด้วยความห่วงใย ในลูกค้า"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    let logoImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Group 16")
        return imageView
    }()
    
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = UIColor.AppColor.background_Blue
     
        addSubview(lbl)
        addConstraintsWithFormat("V:[v0(30)]", views: lbl)
               addConstraintsWithFormat("H:|-20-[v0]-30-|", views: lbl)
       lbl.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 120).isActive = true

        addSubview(lbl1)
        addConstraintsWithFormat("V:[v0(20)]", views: lbl1)
               addConstraintsWithFormat("H:|-20-[v0]-30-|", views: lbl1)
        lbl1.topAnchor.constraint(equalTo: lbl.bottomAnchor,constant: 5).isActive = true
      

        addSubview(logoImage)
        addConstraintsWithFormat("V:[v0(150)]", views: logoImage)
               addConstraintsWithFormat("H:|[v0]|", views: logoImage)
        //logoImage.topAnchor.constraint(equalTo: lbl3.bottomAnchor,constant: 5).isActive = true
        logoImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        logoImage.centerYAnchor.constraint(equalTo: centerYAnchor,constant: -37).isActive = true

    }
    
 
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
}

