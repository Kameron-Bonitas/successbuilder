//
//  DarkViewController.swift
//  SuccessBuilder
//
//  Created by Ben on 15.11.2019.
//  Copyright © 2019 Ben. All rights reserved.
//

import UIKit

class DarkViewController: UIViewController {
    
    let fromPopUpLabel = UILabel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        seUpView()
        
view.backgroundColor = .white
        
        //  For  viewDidLoad      Navigation right button
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(rightBarButtonPressed(_:)))
    }
    

     // Delegate Method
//        func sendDataToDarkViewController (myData: String) {
//           self.fromPopUpLabel.text = myData
//            print(myData)
//        }
//    
    
   
    // MARK: - Navigation
    //    Creating    Navigation right button
    let rightBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Right Item", style: .plain, target: self, action: nil)
        barButtonItem.tintColor = UIColor.blue
        return barButtonItem
    }()
   
    //MARK: - Button ACTIONS
    //    Pressing    Navigation right button
    @objc func rightBarButtonPressed(_ sender: UIButton) {
        let tretijVC = TretijViewController()
         self.navigationController?.pushViewController(tretijVC, animated: true)

            print("Dark!'")
        }
    
//    SetUp View
    
    func seUpView(){
//   fromPopUpLabel
                fromPopUpLabel.text = " "
                fromPopUpLabel.textAlignment = .center
                fromPopUpLabel.font = UIFont(name: "IndieFlower", size: 24)
                fromPopUpLabel.adjustsFontForContentSizeCategory = true
                fromPopUpLabel.textColor = .black
                fromPopUpLabel.backgroundColor = UIColor.gray
                view.addSubview(fromPopUpLabel)
        
        
        
       fromPopUpLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
           fromPopUpLabel.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 250.0),
           fromPopUpLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant:-300),
            fromPopUpLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -50),
            fromPopUpLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 50)
        ])
        
        
        
        
        
    }
    

}
