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
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(messageLabel)
        messageLabel.backgroundColor = .green
        messageLabel.text = "Shit happens!"
        messageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
