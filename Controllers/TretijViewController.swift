//
//  TretijViewController.swift
//  SuccessBuilder
//
//  Created by Ben on 11.11.2019.
//  Copyright © 2019 Ben. All rights reserved.
//

import UIKit
import CoreData

class TretijViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let titleLabel = UILabel()
    let backgroundImage = UIImageView()
    let cancelButton = UIButton()
    let addButton = UIButton()
    let tableView = UITableView()
    private let cellId = "ExperimentalTableViewCell"
    
   
 //    Pryklady Affirmations (hardcoded)
    private var sampleAffis = ["This is a short text.", "This is another text, and it is a little bit longer.", "Wow, this text is really very very long! I hope it can be read completely! Luckily, we are using automatic row height!", "Важлива інформація!Марш Захисників України вже завтра, тому пропонуємо ознайомитись з фінальним інструктажем!1. Збір починається о 10:00 в парку Тараса Шевченка, навпроти Червоного корпусу університету.Слава Україні!","It looks like there is now cirilic version for diese blöde Lato Macciato Fonts", "Dysplaying AFFIRMATIONS in ukraine language is impossible!!!!!!!!!"]
       
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupLayout()
        setupTableView()
        setupView ()
        configureTableView()
        
        view.backgroundColor = .white
        
        //  For  viewDidLoad      Navigation right button
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(rightBarButtonPressed(_:)))
//        
        print("Controller 3")
    }
    
    //MARK: - Button ACTIONS
    // Add Affi PopUp Batton
        @objc func cancelButtonPressed(_ sender: UIButton) {
            // Povertannya do golovnogo (myAffi)
                    let myAffiVC = MyAffirmationsViewController()
                    self.navigationController?.pushViewController(myAffiVC, animated: true)
                         print("Do myAffi!'")
                    }
            
    
    
    //MARK:- Reusable Function
    func setupBackground(imageView: UIImageView, imageNamed imageName: String, to view: UIView) {
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFill
        
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor ),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        //MARK: Castom Font Instance
        // Vykorystovuyem ves' snipet vklyuchno z = true
        guard let customFont = UIFont(name: "Lato-Light", size: UIFont.labelFontSize) else {
            fatalError("""
                Failed to load the "Lato-Light" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """)
            }
        titleLabel.font = UIFontMetrics.default.scaledFont(for: customFont)
        titleLabel.adjustsFontForContentSizeCategory = true
        
    }
   
    private func setupLayout() {
    setupBackground(imageView: backgroundImage, imageNamed: "background.png", to: self.view)
               //titleLabel
               titleLabel.text = "Choose Affirmations"
               titleLabel.textAlignment = .center
               titleLabel.font = UIFont(name: titleLabel.font.fontName, size: 40)
               self.view.addSubview(titleLabel)
               titleLabel.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                   titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 55),
                   titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant:0.0)
               ])
        
               //cancelButton
                cancelButton.backgroundColor = .systemBlue
                cancelButton.setTitle("Cancel", for: .normal)
                cancelButton.tintColor = .white
                cancelButton.layer.cornerRadius = 5
                cancelButton.clipsToBounds = true
        cancelButton.addTarget(self, action: #selector(cancelButtonPressed(_:)), for: .touchUpInside)
        self.view.addSubview(cancelButton)
                cancelButton.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    cancelButton.heightAnchor.constraint(equalToConstant: 50),
                    cancelButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:-50),
                    cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                    cancelButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -15)
        ])
        
        //addlButton
                addButton.backgroundColor = .systemBlue
                addButton.setTitle("Add", for: .normal)
                addButton.tintColor = .white
                addButton.layer.cornerRadius = 5
                addButton.clipsToBounds = true
        self.view.addSubview(addButton)
                addButton.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    addButton.heightAnchor.constraint(equalToConstant: 50),
                    addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:-50),
                    addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                    addButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 15)
        ])
        
    }
    
    func setupTableView() {
       tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ExperimentalTableViewCell")
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 150.0),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -150),
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
        
        print ("setupTableView")
    }
    
    // MARK: - Table View
    private func setupView () {
        //tableView
    tableView.delegate = self
     tableView.dataSource = self
     tableView.backgroundColor = UIColor.clear
     tableView.separatorColor = .clear
     tableView.separatorStyle = .singleLine
     tableView.separatorInset = .zero
     
     tableView.register(ExperimentalTableViewCell.self, forCellReuseIdentifier: cellId)
//     view.addSubview(tableView)
        
        print("setupView")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleAffis.count
    }
 
//    Coreeeeeeeeeeeeeeeeeeeeeeeeee
    //   Zberigayemo v Core vybranyj sampleAffi
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myAffi = sampleAffis[indexPath.row]
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
        let newMyAffirmation = MyAffirmationItem(context: context)
        newMyAffirmation.affirmation = myAffi
           
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
          }
        // Povertannya do golovnogo (myAffi)
        let myAffiVC = MyAffirmationsViewController()
//            self.show(myAffiVC, sender: self)
               self.navigationController?.pushViewController(myAffiVC, animated: true)
             print("Do myAffi!'")
        
    }
    
    
    func configureTableView(){
            tableView.estimatedRowHeight = UITableView.automaticDimension
        print("configureTableView")
            }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ExperimentalTableViewCell
                //Prozzorist' of cell
                cell.backgroundColor = .clear
            let content = sampleAffis[indexPath.row]
                cell.noteLabel.text = content

                print("Tretij cell")
                return cell
    }
}
