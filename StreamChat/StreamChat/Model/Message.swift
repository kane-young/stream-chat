//
//  Message.swift
//  StreamChat
//
//  Created by 이영우 on 2021/08/13.
//

import Foundation

protocol Message {
    var name: String { get set }
    var content: String { get set }
}

struct ConnectionMessage: Message {
    var name: String
    var content: String
}

struct ChatMessage: Message {
    var name: String
    var content: String
    var date: Date
}
