import Foundation
import XCTest

class RecipeListViewModelTest: XCTestCase {

    func testSuccessFetchDataThenShowList() {
        let expectedList = [RecipeItemModel.with()]
        let service = MockService(mockData: expectedList)
        let viewModel = RecipeListViewModel(networkManager: service)
        
        viewModel.fetchData()
        
        XCTAssertTrue((viewModel.error.value?.isEmpty ?? false))
        XCTAssertEqual(viewModel.result.value.count, 1)
    }
    
    func testEmptyDataThenShowEmptyList() {
        let expectedList = [RecipeItemModel]()
        let service = MockService(mockData: expectedList)

        let viewModel = RecipeListViewModel(networkManager: service)

        viewModel.fetchData()

        XCTAssertTrue((viewModel.error.value?.isEmpty ?? false))
        XCTAssertEqual(viewModel.result.value.count, 0)
    }

    func testNilDataThenFailedShowError() {
        let expectedList: [RecipeItemModel]? = nil
        let service = MockService(mockData: expectedList)

        let viewModel = RecipeListViewModel(networkManager: service)

        XCTAssertFalse((viewModel.error.value?.isEmpty ?? false))
        XCTAssertEqual(viewModel.result.value.count, 0)
    }

}
