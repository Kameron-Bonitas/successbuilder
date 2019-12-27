//
//  MyTableViewCell.swift
//  SuccessBuilder
//
//  Created by Ben on 21.10.2019.
//  Copyright © 2019 Ben. All rights reserved.
//

import UIKit
import SwipeCellKit

class MyTableViewCell: UITableViewCell {
    
//   private let upperTransparentBorder: CGFloat = 1
    //MARK: - Views
    var backgroundCellView = UIImageView()
    var noteLabel = MyLabel()
    var numberLabel = UILabel()
  
    
    
    //MARK: - Implementation
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
     setupCellView()
    setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupCellView () {

        contentView.isOpaque = false
        contentView.backgroundColor = UIColor.clear
    
        backgroundCellView.image = UIImage(named: "mycell.png")
        backgroundCellView.backgroundColor = .clear
        contentView.addSubview(backgroundCellView)
        
        // noteLabel
        noteLabel.textAlignment = .left
        noteLabel.font = UIFont(name: "IndieFlower", size: 18)
        noteLabel.adjustsFontForContentSizeCategory = true
        noteLabel.textColor = .black
        noteLabel.backgroundColor = UIColor.clear
        noteLabel.numberOfLines = 0
        
        backgroundCellView.addSubview(noteLabel)
        
        
        // numberLabel
        numberLabel.text = " "
        numberLabel.textAlignment = .center
        numberLabel.font = UIFont(name: "IndieFlower", size: 24)
        numberLabel.adjustsFontForContentSizeCategory = true
        numberLabel.textColor = .black
        numberLabel.backgroundColor = UIColor.clear
        noteLabel.addSubview(numberLabel)
//       contentView.addSubview(numberLabel)
        
        
        

       //Castom Font Instance
        guard UIFont(name: "IndieFlower", size: UIFont.labelFontSize) != nil else {
            fatalError("""
                Failed to load the "IndieFlower" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
//        noteLabel.font = UIFontMetrics.default.scaledFont(for: customFont)
        
    }
    
    private func setupLayout() {
         
//          backgroundCellView
         backgroundCellView.translatesAutoresizingMaskIntoConstraints = false

         NSLayoutConstraint.activate([
            backgroundCellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundCellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backgroundCellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundCellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
             ])
        //noteLabel Layout
        noteLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
//            noteLabel.trailingAnchor.constraint(equalTo: backgroundCellView.trailingAnchor,constant: -30),
//            noteLabel.topAnchor.constraint(equalTo: backgroundCellView.topAnchor, constant: 20),
//            noteLabel.bottomAnchor.constraint(equalTo: backgroundCellView.bottomAnchor, constant: -20),
//            noteLabel.leadingAnchor.constraint(equalTo:backgroundCellView.leadingAnchor, constant: 30)

            noteLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -30),
            noteLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            noteLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            noteLabel.leadingAnchor.constraint(equalTo:contentView.leadingAnchor, constant: 30)

        ])
//
        //numberLabel
//        numberLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            numberLabel.leadingAnchor.constraint(equalTo: noteLabel.leadingAnchor),
//            numberLabel.topAnchor.constraint(equalTo: noteLabel.topAnchor),
//            numberLabel.bottomAnchor.constraint(equalTo:noteLabel.bottomAnchor),
////            numberLabel.trailingAnchor.constraint(equalTo: backgroundCellView.centerXAnchor, constant: -100.0)
//
//            numberLabel.trailingAnchor.constraint(equalTo: noteLabel.leadingAnchor, constant: 103),
////            numberLabel.heightAnchor.constraint(equalTo: backgroundCellView.heightAnchor)
//        ])


        


               //numberLabel
               numberLabel.translatesAutoresizingMaskIntoConstraints = false

               NSLayoutConstraint.activate([
                 numberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
       //            numberLabel.topAnchor.constraint(equalTo: backgroundCellView.topAnchor),
       //            numberLabel.bottomAnchor.constraint(equalTo: backgroundCellView.bottomAnchor),
       //            numberLabel.trailingAnchor.constraint(equalTo: backgroundCellView.centerXAnchor, constant: -100.0)
                numberLabel.trailingAnchor.constraint(equalTo: noteLabel.leadingAnchor, constant: 53.0),
//                   numberLabel.widthAnchor.constraint(equalTo: numberLabel.heightAnchor),
                numberLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor),
                numberLabel.bottomAnchor.constraint (equalTo: contentView.bottomAnchor)
               ])

               
        
           }
//  Image View Selected color
//  Labels Background Selected color
//  Labels Text selected color
    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        //  Labels Taxt Selected color
//        noteLabel.textColor = selected ? UIColor.red : UIColor.black
//        numberLabel.textColor = selected ? UIColor.red : UIColor.black
//        //  Labels Background Selected color
//        noteLabel.backgroundColor = selected ? UIColor.blue : UIColor.clear
//        //  Image View Selected color
//        backgroundCellView.backgroundColor = selected ? UIColor.green : UIColor.clear
        
    }
//    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
//        let color = noteLabel.backgroundColor
//        super.setHighlighted(highlighted, animated: animated)
//        noteLabel.backgroundColor = color
//    }
    
    

//    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
//        super.setHighlighted(highlighted, animated: animated)
////        if let currentStyle = currentStyle, !highlighted {
////            noteLabel.backgroundColor = currentStyle.titleBackgroundColor
////        }
////    }
////
////    override func setSelected(_ selected: Bool, animated: Bool) {
////        super.setSelected(selected, animated: animated)
////        if let currentStyle = currentStyle, !selected {
////            noteLabel.backgroundColor = currentStyle.titleBackgroundColor
////        }
////    }
////
////    func apply(style: Style) {
////        currentStyle = style
////        // ...
//    }
//
    
    
// Custom class MyLabel. Making text marging (width of numberLabel) for noteLabel's text.
    class MyLabel: UILabel{
        override func drawText(in rect: CGRect) {
            super.drawText(in: rect.inset(by: UIEdgeInsets(top: 0, left: 43, bottom: 0, right: 0)))
        }
    }

    //MARK: - OTHERS
    override func prepareForReuse() {
        noteLabel.text = nil
       numberLabel.text = nil
    }

}
