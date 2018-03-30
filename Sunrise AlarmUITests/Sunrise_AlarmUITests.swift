//
//  Sunrise_AlarmUITests.swift
//  Sunrise AlarmUITests
//
//  Created by Joey Tawadrous on 16/03/2018.
//  Copyright © 2018 LongGames. All rights reserved.
//

import XCTest

class Sunrise_AlarmUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
		let app = XCUIApplication()
		setupSnapshot(app)
		app.launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
		
		
//		let app = XCUIApplication()
//		let datePickersQuery = app.datePickers
//		datePickersQuery.pickerWheels["PM"].swipeDown()
//		datePickersQuery.pickerWheels["8 o’clock"].swipeUp()
//		datePickersQuery.pickerWheels["10 o’clock"].swipeUp()
//		datePickersQuery.pickerWheels["30 minutes"].swipeDown()
//
//		let tablesQuery = app.tables
//		tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Wed "]/*[[".cells.staticTexts[\"Wed \"]",".staticTexts[\"Wed \"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//
//		let electronicaStaticText = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Electronica"]/*[[".cells.staticTexts[\"Electronica\"]",".staticTexts[\"Electronica\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//		electronicaStaticText.tap()
//		electronicaStaticText.tap()
//
//		snapshot("Sounds")
//
//		app.navigationBars["Alarm Sound"].buttons["Back"].tap()
//		tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Call parents"]/*[[".cells.staticTexts[\"Call parents\"]",".staticTexts[\"Call parents\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//		app.typeText("Call parents\r")
//
//		snapshot("Alarms")
//
//
//		app.navigationBars["Add Alarm"].buttons["Save"].tap()
//
//		let app = XCUIApplication()
//		app.tables/*@START_MENU_TOKEN@*/.staticTexts["Alarmasdasdasdasds"]/*[[".cells.staticTexts[\"Alarmasdasdasdasds\"]",".staticTexts[\"Alarmasdasdasdasds\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//
//		let clearTextTextField = app.textFields.containing(.button, identifier:"Clear text").element
//		clearTextTextField.typeText("as")
//		clearTextTextField.tap()
//		clearTextTextField.typeText("d")
//		app.typeText("adsas\r")
//
		
		
//		let app = XCUIApplication()
//		let alarmNavigationBar = app.navigationBars["Alarm"]
//		alarmNavigationBar.buttons["Edit"].tap()
//
//		let tablesQuery = tablesQuery2
//		tablesQuery.cells.containing(.button, identifier:"Delete").buttons["Delete 4:00 PM, Alarm, Never"].tap()
//
//		let deleteButton = tablesQuery.buttons["Delete"]
//		deleteButton.tap()
//
//		let tablesQuery2 = tablesQuery
//		tablesQuery2/*@START_MENU_TOKEN@*/.buttons["Delete 4:00 PM, Alarm, Never"]/*[[".cells.buttons[\"Delete 4:00 PM, Alarm, Never\"]",".buttons[\"Delete 4:00 PM, Alarm, Never\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//		deleteButton.tap()
//		alarmNavigationBar.buttons["Add"].tap()
//		tablesQuery2/*@START_MENU_TOKEN@*/.staticTexts["Bell"]/*[[".cells.staticTexts[\"Bell\"]",".staticTexts[\"Bell\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//		tablesQuery2/*@START_MENU_TOKEN@*/.staticTexts["Funky"]/*[[".cells.staticTexts[\"Funky\"]",".staticTexts[\"Funky\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//		app.navigationBars["Alarm Sound"].buttons["Back"].tap()
//		app.navigationBars["Add Alarm"].buttons["Save"].tap()
		
		
		let app = XCUIApplication()
		XCUIApplication().navigationBars["Alarm"].buttons["Add"].tap()
		
		let tablesQuery = app.tables
		tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Never"]/*[[".cells.staticTexts[\"Never\"]",".staticTexts[\"Never\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
		tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Every Tuesday"]/*[[".cells.staticTexts[\"Every Tuesday\"]",".staticTexts[\"Every Tuesday\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
		app.navigationBars["Alarm Days"].buttons["Back"].tap()
		
//		app.tables/*@START_MENU_TOKEN@*/.staticTexts["Alarm"]/*[[".cells.staticTexts[\"Alarm\"]",".staticTexts[\"Alarm\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//		app.textFields.containing(.button, identifier:"Clear text").element.typeText("Call parents")
//		app.typeText("\r")
		
		tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Bell"]/*[[".cells.staticTexts[\"Bell\"]",".staticTexts[\"Bell\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
		tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Funky"]/*[[".cells.staticTexts[\"Funky\"]",".staticTexts[\"Funky\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
		
		snapshot("Sounds")
		
		app.navigationBars["Alarm Sound"].buttons["Back"].tap()
		
		snapshot("Add")

		app.navigationBars["Add Alarm"].buttons["Save"].tap()
		
		snapshot("Alarms")
	}
}
