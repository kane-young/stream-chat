//
//  StreamChatTests.swift
//  StreamChatTests
//
//  Created by 이영우 on 2021/08/13.
//

import XCTest
@testable import StreamChat

class StreamChatTests: XCTestCase {
    func test_when_receive받을것이있을때_then_잘받아오는지_테스트() {
        //given
        let stubViewController = StubViewController()
        let expectMessage: String = "제발되세요"
        //when
        stubViewController.chatRoomManager.join(userName: "kane")
        stubViewController.chatRoomManager.send(message: expectMessage)
        //then
        XCTAssertEqual(stubViewController.receivedMessage, expectMessage)

        stubViewController.chatRoomManager.disconnect()
    }
}
