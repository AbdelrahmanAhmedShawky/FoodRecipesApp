import Foundation
import XCTest

class DetailsViewModelTest: XCTestCase {
    
    func testAddFavoritesItemThenItemIsFavoriteTrue() {
        let service = MockDataManager()
        let expectedList = service.todos[0]
        let viewModel = DetailsViewModel(recipeItem: expectedList, dataManager: service)
        
        viewModel.addFavoritesItem(item: expectedList)
        
        XCTAssertTrue(viewModel.isFavoriteItem(item: expectedList))
    }
    
    func testdeleteFavoritesItemThenItemIsFavoriteFalse() {
        let service = MockDataManager()
        let expectedList = service.todos[0]
        let viewModel = DetailsViewModel(recipeItem: expectedList, dataManager: service)
        
        viewModel.deleteFavoritesItem(item: expectedList)
        
        XCTAssertFalse(viewModel.isFavoriteItem(item: expectedList))
        
    }
    
    func testGetFavoritesItemThenGetFavoriteListTrue() {
        let expectedList = RecipeItemModel.with()
        let service = MockDataManager()
        let viewModel = DetailsViewModel(recipeItem: expectedList, dataManager: service)
        
        viewModel.addFavoritesItem(item: expectedList)
        
        let getFavorites = viewModel.isFavoriteItem(item: expectedList)
        
        XCTAssertNotNil(getFavorites)
        XCTAssertTrue(getFavorites)
    }
    
    func testAddFavoritesItemThenFavoriteListCountIsEqualTrue() {
        let service = MockDataManager()
        let expectedList = service.todos[0]
        let viewModel = DetailsViewModel(recipeItem: expectedList, dataManager: service)
        
        viewModel.addFavoritesItem(item: service.todos[0])
        viewModel.addFavoritesItem(item: service.todos[1])
        
        XCTAssertEqual(viewModel.fetchFavoritesListList().count, 2)
       
    }
}
