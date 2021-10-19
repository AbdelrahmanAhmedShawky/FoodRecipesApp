import Foundation
import XCTest

class DetailsViewModelTest: XCTestCase {
    
    func testAddFavoritesItemThenItemIsFavoriteTrue() {
        let service = MockDataManager()
        
        let expectedItem = service.todosArray[0]
        let viewModel = DetailsViewModel(recipeItem: expectedItem, dataManager: service)
        
        XCTAssertFalse(viewModel.isFavoriteItem(item: expectedItem))
        
        viewModel.addFavoritesItem(item: expectedItem)
        
        XCTAssertTrue(viewModel.isFavoriteItem(item: expectedItem))
    }
    
    func testdeleteFavoritesItemThenItemIsFavoriteFalse() {
        let service = MockDataManager()
        let expectedItem = service.todosArray[0]
        let viewModel = DetailsViewModel(recipeItem: expectedItem, dataManager: service)
       
        viewModel.deleteFavoritesItem(item: expectedItem)
        
        XCTAssertFalse(viewModel.isFavoriteItem(item: expectedItem))
        
    }
    
    func testGetFavoritesItemThenGetFavoriteListTrue() {
       
        let service = MockDataManager()
        let expectedItem = service.todosArray[0]
        let viewModel = DetailsViewModel(recipeItem: expectedItem, dataManager: service)
        
        viewModel.addFavoritesItem(item: expectedItem)
        
        let getFavorites = viewModel.isFavoriteItem(item: expectedItem)
        
        XCTAssertNotNil(getFavorites)
        XCTAssertTrue(getFavorites)
    }
    
    func testAddFavoritesItemThenFavoriteListCountIsEqualTrue() {
        let service = MockDataManager()
        let expectedItem = service.todosArray[0]
        let viewModel = DetailsViewModel(recipeItem: expectedItem, dataManager: service)
        
        XCTAssertEqual(viewModel.fetchFavoritesListList().count, 0)
        
        viewModel.addFavoritesItem(item: service.todosArray[0])
        viewModel.addFavoritesItem(item: service.todosArray[1])
        
        XCTAssertEqual(viewModel.fetchFavoritesListList().count, 2)
       
    }
}
