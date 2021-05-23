//
//  ComfortAppTests.swift
//  ComfortAppTests
//
//  Created by Ivan Kopiev on 22.04.2021.
//

import XCTest
@testable import ComfortApp

class ComfortAppTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testEnterValidDataInTextField() throws {
        let authVC = AuthViewController()
        authVC.setUp()
        let testLabel = authVC.mainLabel.text // "Авторизация\nКомфорт"
        authVC.loginTextfield.text = "1"
        authVC.sighIn() // Попытка входа с вводом только одного поля
        // mainLabel Должен поменять текст на "Заполните все поля"
        XCTAssertNotEqual(testLabel, authVC.mainLabel.text) // Проверка, что поля не равны
        XCTAssertEqual("Заполните все поля", authVC.mainLabel.text) // Проверка текста
    }

 

}
