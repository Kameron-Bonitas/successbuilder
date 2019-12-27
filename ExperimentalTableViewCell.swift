//
//  ExperimentalTableViewCell.swift
//  SuccessBuilder
//
//  Created by Ben on 07.11.2019.
//  Copyright © 2019 Ben. All rights reserved.
//

import UIKit

class ExperimentalTableViewCell: UITableViewCell {


    
    var backgroundCellView = UIImageView()
    var cellView = UIView()
    var noteLabel = MyLabel()
    var numberLabel = UILabel()


    //MARK: - Implementation
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
         
         
            setupCellView()
            setupLayout()
        }
    
    private func setupCellView () {

        contentView.isOpaque = false
        contentView.backgroundColor = UIColor.clear
        
        // cellView
       cellView.backgroundColor = UIColor (named: "tretijCellBackground")
        cellView.layer.cornerRadius = 10
        
        contentView.addSubview(cellView)
        
        // noteLabel
        noteLabel.textAlignment = .left
        noteLabel.font = UIFont(name: "IndieFlower", size: 18)
        noteLabel.adjustsFontForContentSizeCategory = true
        noteLabel.textColor = .black
        noteLabel.backgroundColor = UIColor.clear
        noteLabel.numberOfLines = 0
        
        cellView.addSubview(noteLabel)
        
        // numberLabel
        numberLabel.text = "❊"
        numberLabel.textAlignment = .center
//        numberLabel.font = UIFont(name: "IndieFlower", size: 24)
        numberLabel.adjustsFontForContentSizeCategory = true
        numberLabel.textColor = .black
        numberLabel.backgroundColor = UIColor.clear
        noteLabel.addSubview(numberLabel)
       
    }
    
     private func setupLayout() {
        
                // cellView
                 cellView.translatesAutoresizingMaskIntoConstraints = false

                 NSLayoutConstraint.activate([
                    cellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10.0),
                    cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10.0),
                    cellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0),
                    cellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0)
                     ])
                // noteLabel
                noteLabel.translatesAutoresizingMaskIntoConstraints = false

                  NSLayoutConstraint.activate([

                    noteLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -30),
                    noteLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
                    noteLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
                    noteLabel.leadingAnchor.constraint(equalTo:contentView.leadingAnchor, constant: 30)
                     ])
             
                // numberLabel
                   numberLabel.translatesAutoresizingMaskIntoConstraints = false

                   NSLayoutConstraint.activate([
                     numberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                     numberLabel.trailingAnchor.constraint(equalTo: noteLabel.leadingAnchor, constant: 53.0),
                     numberLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor),
                     numberLabel.bottomAnchor.constraint (equalTo: contentView.bottomAnchor)
                     ])
        
                //Castom Font Instance
                guard UIFont(name: "IndieFlower", size: UIFont.labelFontSize) != nil else {
                   fatalError("""
                       Failed to load the "IndieFlower" font.
                       Make sure the font file is included in the project and the font name is spelled correctly.
                       """)
                    }
            }
    
//       // Cell/Label Selection
//       override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        //  Labels Taxt Selected color
//        noteLabel.textColor = selected ? UIColor.white : UIColor.black
//        numberLabel.textColor = selected ? UIColor.green : UIColor.black
//        //  Labels Background Selected color
//        noteLabel.backgroundColor = selected ? UIColor.blue : UIColor.clear
//        //  Image View Selected color
//        cellView.backgroundColor = selected ? UIColor.green : UIColor.red 
//
//        }
//    
          // Custom class MyLabel. Making text marging (width of numberLabel) for noteLabel's text.
          class MyLabel: UILabel{
              override func drawText(in rect: CGRect) {
                  super.drawText(in: rect.inset(by: UIEdgeInsets(top: 0, left: 43, bottom: 0, right: 0)))
              }
          }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
