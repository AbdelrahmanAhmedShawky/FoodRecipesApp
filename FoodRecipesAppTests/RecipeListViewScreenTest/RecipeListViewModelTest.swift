import Foundation
import XCTest

class RecipeListViewModelTest: XCTestCase {

    func testSuccessFetchData() {
        let expectedList = [RecipeItemModel.with()]
        let service = MockService(mockData: expectedList)
        let viewModel = RecipeListViewModel(networkManager: service)
        
        viewModel.fetchData()
        
        XCTAssertTrue((viewModel.error.value?.isEmpty ?? false))
        XCTAssertEqual(viewModel.result.value.count, 1)
    }
    
    func testEmptyData() {
        let expectedList = [RecipeItemModel]()
        let service = MockService(mockData: expectedList)

        let viewModel = RecipeListViewModel(networkManager: service)

        viewModel.fetchData()

        XCTAssertTrue((viewModel.error.value?.isEmpty ?? false))
        XCTAssertEqual(viewModel.result.value.count, 0)
    }

    func testNilData() {
        let expectedList: [RecipeItemModel]? = nil
        let service = MockService(mockData: expectedList)

        let viewModel = RecipeListViewModel(networkManager: service)

        viewModel.fetchData()

        XCTAssertTrue((viewModel.error.value?.isEmpty ?? false))
        XCTAssertEqual(viewModel.result.value.count, 0)
    }

}
