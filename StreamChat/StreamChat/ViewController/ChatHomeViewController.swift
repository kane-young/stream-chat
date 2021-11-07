//
//  ChatHomeViewController.swift
//  StreamChat
//
//  Created by 이영우 on 2021/08/13.
//

import UIKit

class ChatHomeViewController: UIViewController {
    let chatRoomManager = ChatRoomManager(host: ChatRoom.host, port: ChatRoom.port)

    override func viewDidLoad() {
        super.viewDidLoad()
        chatRoomManager.join(userName: "kane")
        chatRoomManager.send(message: "hi")
        chatRoomManager.delegate = self
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        chatRoomManager.disconnect()
    }
}

extension ChatHomeViewController: ChatRoomManagerDelegate {
    func receive(_ chatDataFormat: Message) {
        print(chatDataFormat)
    }

    func handleError(_ error: Error) {
        print(error)
    }
}
