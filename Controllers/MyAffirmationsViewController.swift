//
//  MyAffirmationsViewController.swift
//  SuccessBuilder
//
//  Created by Ben on 14.10.2019.
//  Copyright © 2019 Ben. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications
import EventKit
import SwipeCellKit
import StoreKit

class MyAffirmationsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //MARK: - Properties
      let backgroundImage = UIImageView()
      let titleLabel = UILabel()
      var plusButton = UIButton()
      let tableView = UITableView()
    
    var isSwipeRightEnabled = true
     let eventStore = EKEventStore()
    
    //    Coreeeeeeeeeeeeeeeeeeeeeeeeee
    var myAffis : [MyAffirmationItem] = []
    
  
////    Pryklad do autonalashtuvannya vysoty cells
//private var exampleContent = ["This is a short text.", "This is another text, and it is a little bit longer.", "Wow, this text is really very very long! I hope it can be read completely! Luckily, we are using automatic row height!"]
    
   private let cellIdentifier = "MyTableViewCell"
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
        configureTableView()
        zaraza()
 //  Vyrishennya problemy zatemnenogo backgroundImage!!!!!!!!!!!!!!!!!!
        view.backgroundColor = .white
//     countAppLaunchesSwitchOnThem()
        //Navigation right button
//            navigationRightButton()
        }
    
    
    
    //  MARK: - Fetching z perezavantazhennyam stola
    //   Coreeeeeeeeeeeeeeeeeeeeeeeeee
    func zaraza ()-> (){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
        if let coreDataMyAffirmationItems = try? context.fetch(MyAffirmationItem.fetchRequest()) as? [MyAffirmationItem] {
            myAffis = coreDataMyAffirmationItems
        tableView.reloadData()
            print("Fetching")
                }
            }
        }
    
    
    //MARK:- Reusable Function
    func setupBackground(imageView: UIImageView, imageNamed imageName: String, to view: UIView) {
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo:self.view.bottomAnchor),
            imageView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    //MARK: Castom Font Instance
            guard let customFont = UIFont(name: "Lato-Light", size: UIFont.labelFontSize) else {
                fatalError("""
                    Failed to load the "Lato-Light" font.
                    Make sure the font file is included in the project and the font name is spelled correctly.
                    """
                )
            }
//        Sho tse nah*j???? NASTYA
            titleLabel.font = UIFontMetrics.default.scaledFont(for: customFont)
            titleLabel.adjustsFontForContentSizeCategory = true
        }
    
    

//MARK: - Button ACTIONS
// Add Affi PopUp Batton
    @objc func addAffiPopUpButtonPressed(_ sender: UIButton) {
        let addAffiVC = AddAffirmationPopUpViewController()
//        addAffiVC.modalPresentationStyle = .overCurrentContext
        addAffiVC.zaraza = zaraza
//        self.present(addAffiVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(addAffiVC, animated: true)
    print("Affa!")
    }
    
    

    private func setupLayout() {
        setupBackground(imageView: backgroundImage, imageNamed: "background.png", to: self.view)
    
        //titleLabel
        titleLabel.text = "My Affirmations"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: titleLabel.font.fontName, size: 40)
        self.view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 55),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant:0.0)
        ])
            
        //plusButton
        plusButton.addTarget(self, action: #selector(addAffiPopUpButtonPressed(_:)), for: .touchUpInside)
         plusButton.setImage(UIImage(named: "bitmap.png"), for: .normal)
         view.addSubview(plusButton)
        
         plusButton.translatesAutoresizingMaskIntoConstraints = false
       
         NSLayoutConstraint.activate([
            plusButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 13),
            plusButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant:0.0)
        ])
        // TableView
        // Chomus': <view.addSubview(tableView)> has to be here.Not after <NSLayoutConstraint.activate>
        // because we have constaints conflict. And not after:  <tableView.register(MyTableViewCell.self, forCellReuseIdentifier: cellIdentifier)>, because tableView then is behind the <backgroundImage>!!;))
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: plusButton.bottomAnchor, constant: 34),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
            ])
        
        }
    
    //MARK:- Navigation. Making Navigation Bar Prozzoroyu
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        // Make the navigation bar background clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
      navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Restore the navigation bar to default
//        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
//        navigationController?.navigationBar.shadowImage = nil
    }
    
    private func setupView () {
        
      // MARK: - Table View
           //tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clear
        tableView.separatorColor = .clear
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = .zero
        
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myAffis.count
            }

        func configureTableView(){
//        tableView.rowHeight = 60.0
//        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
//        tableView.contentInset = UIEdgeInsets(top: 20.0, left: 0.0, bottom: 0.0, right: 0.0)
//         tableView.reloadData()
        }

    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MyTableViewCell
            //Prozzorist' of cell
            cell.backgroundColor = .clear
            cell.numberLabel.text = "\(indexPath.row+1)"
            
            //    Coreeeeeeeeeeeeeeeeeeeeeeeeee
            let myAffi = myAffis[indexPath.row]
            cell.noteLabel.text = myAffi.affirmation
            //        Selection of cell is off
                    cell.selectionStyle = .none
         
        return cell
        }
    
    //   Deleting with Swipe Action Left Coreeeeeeeeeeeeeeeeeee
       func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       if editingStyle == .delete {

          let myAffi = myAffis[indexPath.row]
                     if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                         context.delete(myAffi)
                         (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                        zaraza()
                     }
    
    }

    }
}



////MARK: - METHODS FOR SWIPE ACTIONS
//extension MyAffirmationsViewController: SwipeTableViewCellDelegate {
//    
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
//        
//        if orientation == .left {
//            guard isSwipeRightEnabled else { return nil }
//            
//           
//            //REMINDER
//            let setReminder = SwipeAction(style: .default, title: nil) { [weak self](action, indexPath) in
//                self?.addReminder(at: indexPath)
//                let cell: SwipeTableViewCell = tableView.cellForRow(at: indexPath) as! SwipeTableViewCell
//                cell.hideSwipe(animated: true)
//            }
//            setReminder.image = ImageInListController.reminderForSwipeCell
//            setReminder.backgroundColor = Color.swipeCellBackgroundColorForDefault
//            
//            //EDITING
//            let changeTextAction = SwipeAction(style: .default, title: nil) { [weak self](action, indexpath) in
//                self?.goToUserInputPopupAndChangeName(at: indexPath)
//                let cell: SwipeTableViewCell = tableView.cellForRow(at: indexPath) as! SwipeTableViewCell
//                cell.hideSwipe(animated: true)
//            }
//            changeTextAction.backgroundColor = Color.swipeCellBackgroundColorForDefault
//            changeTextAction.image = ImageInListController.changeTitleForSwipeCell
//            
//            
//            
//            return [setReminder, changeTextAction ]
//            
//        }else{
//            
//            //DELETE
//            let deleteAction = SwipeAction(style: .destructive, title: nil) {[weak self] (action, indexPath) in
//                self?.deleteListe(at: indexPath)
//            }
//            deleteAction.image = ImageInListController.deleteForSwipeCell
//            deleteAction.backgroundColor = Color.swipeCellBackGroundColorForDestructive
//            
//            return [deleteAction]
//        }
//        
//    }
//    
//    //makes different expansion styles possible (such as deleting by swiping till it disappears)
//    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeTableOptions {
//        
//        var options = SwipeTableOptions()
//      
//        //diferent expansion styles
//        options.expansionStyle = orientation == .left ? .selection : .destructive
//        options.minimumButtonWidth = ListConctollerCellMesurements.minimumSwipeCellWidth
//        return options
//    }
//    
//    func addReminder(at indexpath: IndexPath) {
////        NotificationReminder.body = helperRealmManager.lists![indexpath.row].name
//        getNotificationSettingStatus()
//    }
//    
//    //deletes the list
//    func deleteListe (at indexpath: IndexPath) {
////        helperRealmManager.deleteListAndItsItems(atRow: indexpath.row)
//    }
//    
//    func goToUserInputPopupAndChangeName (at indexPath: IndexPath) {
//
////        if let chosenListeToUpdate = helperRealmManager.lists?[indexPath.row] {
////
////            let userTextInputVC = UserTextInputViewController()
////            userTextInputVC.changeName = changeName(_:_:_:)
////            userTextInputVC.changingNameAndIcon = true
////            userTextInputVC.listeToUpdate = chosenListeToUpdate
////            userTextInputVC.modalPresentationStyle = .overCurrentContext
////
////            self.present(userTextInputVC, animated: true, completion: nil)
////        }
//        
//    }
//    
//    
//    
////    //MARK: - DIFFERENT METHODS
////    func countAppLaunchesSwitchOnThem () {
////        let currentCount = appLaunchCount()
////
////        switch currentCount {
////        case 1:
////            threeHardCodedExamples()
////            helperRealmManager.loadLists()
////            tableView.reloadData()
////        case 10, 50, 100:
////            promtForReview()
////            helperRealmManager.loadLists()
////            tableView.reloadData()
////        default:
////            helperRealmManager.loadLists()
////            tableView.reloadData()
////        }
////    }
//    
//    func appLaunchCount() -> Int {
//        var currentCount = UserDefaults.standard.integer(forKey: "launchCount")
//        currentCount += 1
//        UserDefaults.standard.set(currentCount, forKey: "launchCount")
//        return currentCount
//    }
//    
//    func promtForReview() {
//        if #available(iOS 10.3, *) {
//            SKStoreReviewController.requestReview()
//        }
//    }
//    
////    ///creates a liste and saves it in Realm
////    func createListe (_ liste: Liste) ->() {
////        helperRealmManager.save(list: liste)
////        tableView.reloadData()
////    }
////    
////    ///changes the list's name and the icon
////    func changeName (_ liste: Liste, _ newName: String, _ newIconName: String ) ->() {
////        helperRealmManager.changeListName(liste, newName, newIconName)
////        tableView.reloadData()
////    }
//    
////    func threeHardCodedExamples () {
////        let firstListe = Liste()
////        firstListe.name = ListNames.name1
////        firstListe.iconName = Icons.gray[3]
////        helperRealmManager.save(list: firstListe)
////
////        let secondListe = Liste()
////        secondListe.name = ListNames.name2
////        secondListe.iconName = Icons.gray[0]
////        helperRealmManager.save(list: secondListe)
////
////        let thirdListe = Liste()
////        thirdListe.name = ListNames.name3
////        thirdListe.iconName = Icons.gray[2]
////        helperRealmManager.save(list: thirdListe)
////
////    }
//    
//    
//    
//    //MARK: - EVENTKIT AND CALENDAR METHODS
//    
//    
//    
//    
//    
//    
//    func goToSettingsAllert (alertTitle: String, alertMessage: String) {
//        
//        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
//        
//        let settingsAction = UIAlertAction(title: "Settings", style: .default) {(action) in
//            guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {
//                return
//            }
//            if UIApplication.shared.canOpenURL(settingsURL) {
//                UIApplication.shared.open(settingsURL, completionHandler: { (success) in
//                    print("Settings opened: \(success)")
//                })
//            }
//        }
//        alert.addAction(settingsAction)
//        
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        alert.addAction(cancelAction)
//        
//        DispatchQueue.main.async { [weak self] in
//            self?.present(alert, animated: true, completion: nil)
//        }
//    }
//    
//    //MARK: - NOTIFICATION CENTER MATHODS (REMINDERS)
//    
//    func getNotificationSettingStatus () {
//        
//        UNUserNotificationCenter.current().getNotificationSettings {[weak self] (settings) in
//            guard let `self` = self else {return}
//            
//            switch settings.authorizationStatus {
//            case .authorized:
//                DispatchQueue.main.async {
//                    // UI work here
//                    self.goToPopupAndSetReminder()
//                }
//            case .denied, .notDetermined, .provisional:
//                self.goToSettingsAllert(alertTitle: SettingsAlert.title, alertMessage: SettingsAlert.message)
//            @unknown default:
//                print("unknown case of authorisationStatus")
//            }
//        }
//    }
//    
//    func goToPopupAndSetReminder () {
//        let dpVC = DatePickerPopupViewController()
//        dpVC.dateForCalendar = false
//        dpVC.modalPresentationStyle = .overCurrentContext
//        dpVC.setReminder = setReminder
//        self.present(dpVC, animated: true, completion: nil)
//    }
//    
//    func setReminder (_ components: DateComponents) ->(){
//        
//        let content = UNMutableNotificationContent()
////        content.title = NotificationReminder.title
////        content.body = NotificationReminder.body
//        content.sound = UNNotificationSound.default
//        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
//        let request = UNNotificationRequest(identifier: content.body, content: content, trigger: trigger)
//        
//        UNUserNotificationCenter.current().add(request) { (error) in
//            print(request.identifier)
//            
//            if let error = error {
//                print(" We had an error: \(error)")
//                
//            }
//        }
//    }
//    
//}
