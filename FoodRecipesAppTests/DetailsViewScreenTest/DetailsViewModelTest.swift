import Foundation
import XCTest

class DetailsViewModelTest: XCTestCase {
    
    func testAddFavoritesItem() {
        let expectedList = RecipeItemModel.with()
        let service = MockDataManager()
        let viewModel = DetailsViewModel(recipeItem: expectedList, dataManager: service)
        
        viewModel.addFavoritesItem(item: expectedList)
        
        XCTAssertTrue(viewModel.getItemFavorites(item: expectedList))
        
    }
    
    func testdeleteFavoritesItem() {
        let expectedList = RecipeItemModel.with()
        let service = MockDataManager()
        let viewModel = DetailsViewModel(recipeItem: expectedList, dataManager: service)
        
        viewModel.deleteFavoritesItem(item: expectedList)
        
        XCTAssertFalse(viewModel.getItemFavorites(item: expectedList))
        
    }
    
    func testGetFavoritesItem() {
        let expectedList = RecipeItemModel.with()
        let service = MockDataManager()
        let viewModel = DetailsViewModel(recipeItem: expectedList, dataManager: service)
        
        viewModel.addFavoritesItem(item: expectedList)
        
        let getFavorites = viewModel.getItemFavorites(item: expectedList)
        
        XCTAssertNotNil(getFavorites)
        XCTAssertTrue(getFavorites)
    }
}
