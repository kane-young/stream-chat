//
//  ChatError.swift
//  StreamChat
//
//  Created by 이영우 on 2021/08/13.
//

import Foundation

enum ChatError: Error {
    case notExistedSocket
    case invalidResponseFormat
}
