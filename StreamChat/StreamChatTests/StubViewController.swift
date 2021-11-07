//
//  StreamTestStub.swift
//  StreamChatTests
//
//  Created by 이영우 on 2021/08/13.
//

import XCTest
@testable import StreamChat

class StubViewController {
    let chatRoomManager = ChatRoomManager(host: ChatRoom.host, port: ChatRoom.port)
    var receivedMessage: String?

    init() {
        self.chatRoomManager.delegate = self
    }
}

extension StubViewController: ChatRoomManagerDelegate {
    func receive(_ message: Message) {
        receivedMessage = message.content
    }

    func handleError(_ error: Error) {
        XCTFail("error발생")
    }
}
