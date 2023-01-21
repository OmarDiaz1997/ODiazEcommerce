//
//  OdiazEcommerceTests.swift
//  OdiazEcommerceTests
//
//  Created by MacbookMBA8 on 17/01/23.
//

import XCTest
@testable import OdiazEcommerce

final class OdiazEcommerceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDepartamentoAdd() throws{
        let departamentoViewModel = DepartamentoViewModel()
        let result = departamentoViewModel.Add(departamento: Departamento(IdDepartamento: 0, Nombre: "Test", Area: Area(IdArea: 20, Nombre: "")))
        XCTAssertTrue(result.Correct, result.ErrorMessage)
    }
    
    func testDepartamentoAdd2() throws{
        let departamentoViewModel = DepartamentoViewModel()
        let result = departamentoViewModel.Add(departamento: Departamento(IdDepartamento: 0, Nombre: "Test", Area: Area(IdArea: 1, Nombre: "")))
        XCTAssertTrue(result.Correct, result.ErrorMessage)
    }
    
    func testDepartamentoAdd3() throws{
        let departamentoViewModel = DepartamentoViewModel()
        let result = departamentoViewModel.Add(departamento: Departamento(IdDepartamento: 0, Nombre: "Test", Area: Area(IdArea: 100, Nombre: "")))
        XCTAssertFalse(result.Correct, result.ErrorMessage)
    }
    
    func testDepartamentoGetAll() throws{
        let departamentoViewModel = DepartamentoViewModel()
        let result = departamentoViewModel.GetAll()
        XCTAssertTrue(result.Correct, result.ErrorMessage)
    }
    
    func testDepartamentoGetAll2() throws{
        let departamentoViewModel = DepartamentoViewModel()
        let result = departamentoViewModel.GetAll()
        XCTAssertFalse(result.Correct, result.ErrorMessage)
    }
    
    func testDepartamentoGetByID() throws{
        let departamentoViewModel = DepartamentoViewModel()
        let result = departamentoViewModel.GetById(IdDepartamento: 1)
        XCTAssertTrue(result.Correct, result.ErrorMessage)
    }
    func testDepartamentoGetByID2() throws{
        let departamentoViewModel = DepartamentoViewModel()
        let result = departamentoViewModel.GetById(IdDepartamento: 100)
        XCTAssertTrue(result.Correct, result.ErrorMessage)
    }
    func testDepartamentoGetById3() throws{
        let departamentoViewModel = DepartamentoViewModel()
        let result = departamentoViewModel.GetById(IdDepartamento: 1)
        XCTAssertFalse(result.Correct, result.ErrorMessage)
    }
    
    func testDepartamentoDelete() throws{
        let departamentoViewModel = DepartamentoViewModel()
        let result = departamentoViewModel.Delete(IdDepartamento: 2)
        XCTAssertTrue(result.Correct, result.ErrorMessage)
    }
    func testDepartamentoDelete2() throws{
        let departamentoViewModel = DepartamentoViewModel()
        let result = departamentoViewModel.Delete(IdDepartamento: 100)
        XCTAssertTrue(result.Correct, result.ErrorMessage)
    }
    func testDepartamentoDelete3() throws{
        let departamentoViewModel = DepartamentoViewModel()
        let result = departamentoViewModel.Delete(IdDepartamento: 100)
        XCTAssertFalse(result.Correct, result.ErrorMessage)
    }
    
    func testDepartamentoUpdate() throws {
        let departamentoViewModel = DepartamentoViewModel()
        let result = departamentoViewModel.Update(departamento:
        Departamento(IdDepartamento: 2, Nombre: "Test", Area: Area(IdArea: 2, Nombre: "")))
        XCTAssertTrue(result.Correct, result.ErrorMessage)
    }
    
    func testDepartamentoUpdate2() throws {
        let departamentoViewModel = DepartamentoViewModel()
        let result = departamentoViewModel.Update(departamento:
        Departamento(IdDepartamento: 2, Nombre: "Test", Area: Area(IdArea: 2, Nombre: "")))
        XCTAssertFalse(result.Correct, result.ErrorMessage)
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
