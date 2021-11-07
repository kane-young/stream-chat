//
//  ChatPostFormat.swift
//  StreamChat
//
//  Created by 이영우 on 2021/08/13.
//

import Foundation

enum ChatPostFormat {
    case myJoin(userName: String)
    case myDisconnect
    case post(message: String)

    var data: Data? {
        switch self {
        case .myJoin(let name):
            return "USR_NAME::\(name)::END".data(using: .utf8)
        case .myDisconnect:
            return "LEAVE::::END".data(using: .utf8)
        case .post(let message):
            return "MSG::\(message)::END".data(using: .utf8)
        }
    }
}
