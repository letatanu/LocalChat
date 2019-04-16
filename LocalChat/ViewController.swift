//
//  ViewController.swift
//  LocalChat
//
//  Created by Le Nhut on 4/11/19.
//  Copyright © 2019 Le Nhut. All rights reserved.
//

import UIKit
struct ChatMessage {
    let text: String
    let isIncoming: Bool
    let date: Date
}

extension Date {
    static func dateFromCustomString(customString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.date(from: customString) ?? Date()
    }
}
class ViewController: UITableViewController {
    fileprivate let cellID = "id"
    let textMessages = [
        [
            ChatMessage(text: "This is my first message", isIncoming: true, date: Date.dateFromCustomString(customString: "08/12/2019")),
            ChatMessage(text: "How long it is. It is very long message", isIncoming: false, date: Date.dateFromCustomString(customString: "09/21/2019"))],
        [
            ChatMessage(text: "One important feature of the chat messages is the option to change the background color depending on incoming vs outgoing status.  Today's lesson will show you how to do this as well as align our chat messages to the left and right side of the screen. Enjoy.", isIncoming: false, date: Date()),
            ChatMessage(text: "How long it is. It is very long message", isIncoming: false, date: Date())],
        [
            ChatMessage(text: "One important feature of the chat messages is the option to change the background color depending on incoming vs outgoing status.  Today's lesson will show you how to do this as well as align our chat messages to the left and right side of the screen. Enjoy.", isIncoming: false, date: Date()),
            ChatMessage(text: "How long it is. It is very long message", isIncoming: false, date: Date())],
        [
            ChatMessage(text: "One important feature of the chat messages is the option to change the background color depending on incoming vs outgoing status.  Today's lesson will show you how to do this as well as align our chat messages to the left and right side of the screen. Enjoy.", isIncoming: false, date: Date()),
            ChatMessage(text: "How long it is. It is very long message", isIncoming: false, date: Date())]
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier:  cellID)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return textMessages.count
    }
    class DateHeaderLabel: UILabel {
        override init(frame: CGRect) {
            super.init(frame: frame)
            backgroundColor = .green
            textAlignment = .center
            translatesAutoresizingMaskIntoConstraints = false
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override var intrinsicContentSize: CGSize {
            let originalSize = super.intrinsicContentSize
            let height = originalSize.height + 12
            layer.cornerRadius = height / 2
            layer.masksToBounds = true
            return CGSize(width: originalSize.width + 16, height: height)
        }
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = DateHeaderLabel()
        
        if let firstMessageSection = textMessages[section].first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let dateString  = dateFormatter.string(from: firstMessageSection.date)
            label.text = dateString
        }
        
        
        let containerView = UIView()
        containerView.addSubview(label)
        label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
        return containerView
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if let firstMessageSection = textMessages[section].first {
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "MM/dd/yyyy"
//            let dateString  = dateFormatter.string(from: firstMessageSection.date)
//            return dateString
//        }
//        return "Section: \(Date())"
//    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textMessages[section].count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ChatMessageCell
        let chatMessage = textMessages[indexPath.section][indexPath.row]
        cell.chatMessage = chatMessage
        return cell 
    }
}

