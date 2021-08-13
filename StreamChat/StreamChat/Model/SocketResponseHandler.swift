//
//  SocketResponseHandler.swift
//  StreamChat
//
//  Created by 이영우 on 2021/08/13.
//

import Foundation

struct SocketResponseHandler {
    private let maxBufferSize: Int
    init(maxBufferSize: Int) {
        self.maxBufferSize = maxBufferSize
    }

    func receivedMessage(inputStream: InputStream) -> Message? {
        let pointer = UnsafeMutablePointer<UInt8>.allocate(capacity: maxBufferSize)
        var convertedMessage: Message?
        while inputStream.hasBytesAvailable {
            let numberOfBytesRead = inputStream.read(pointer, maxLength: maxBufferSize)
            if numberOfBytesRead < 0, let error = inputStream.streamError {
                print(error.localizedDescription)
                return nil
            }
            guard let message = String(bytesNoCopy: pointer,
                                       length: numberOfBytesRead,
                                       encoding: .utf8, freeWhenDone: true) else {
                return nil
            }
            convertedMessage = convert(message)
        }
        return convertedMessage
    }

    private func convert(_ message: String) -> Message? {
        let message = message.replacingOccurrences(of: "\0", with: "")

        if message.contains(ChatRoom.messageSeperator) {
            let elements = message.components(separatedBy: ChatRoom.messageSeperator)
            guard let sender = elements.first else { return nil }
            guard let content = elements.last else { return nil }
            return ChatMessage(name: sender, content: content, date: Date())
        } else if message.contains(ChatRoom.joinPostfix) {
            if let sender = message.components(separatedBy: ChatRoom.joinPostfix).first {
                return ConnectionMessage(name: sender, content: ChatRoom.joinPostfix)
            }
        } else if message.contains(ChatRoom.leavePostfix) {
            if let sender = message.components(separatedBy: ChatRoom.leavePostfix).first {
                return ConnectionMessage(name: sender, content: ChatRoom.leavePostfix)
            }
        }
        return nil
    }
}
