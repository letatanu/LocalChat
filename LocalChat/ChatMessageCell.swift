//
//  ChatMessageCell.swift
//  LocalChat
//
//  Created by Le Nhut on 4/11/19.
//  Copyright © 2019 Le Nhut. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {

    let messageLabel = UILabel()
    let BackgroundView = UIView()
    
    var chatMessage: ChatMessage! {
        didSet {
            BackgroundView.backgroundColor = chatMessage.isIncoming ? .white : .darkGray
            messageLabel.textColor = chatMessage.isIncoming ? .black : .white
            
            messageLabel.text = chatMessage.text
            
            if chatMessage.isIncoming {
                leadingConstraint.isActive = true
                trailingConstraint.isActive = false
            }
            else {
                leadingConstraint.isActive = false
                trailingConstraint.isActive = true
            }
        }
    }
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        BackgroundView.backgroundColor = .yellow
        BackgroundView.translatesAutoresizingMaskIntoConstraints = false
        BackgroundView.layer.cornerRadius = 12
        
        addSubview(BackgroundView)
        self.addSubview(messageLabel)

        messageLabel.text = "Shit happens! This is very very long message needing to be displayed on the screen to test how long it is."
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.numberOfLines = 0

        // Constraints for label
        let constraints = [
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32 ),
            messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            
            BackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16),
            BackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
            BackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16),
            BackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -16),
            
            ]
        NSLayoutConstraint.activate(constraints)
        leadingConstraint = messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32)
        trailingConstraint = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        


    }

    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
