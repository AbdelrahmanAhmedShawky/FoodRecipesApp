//
//  MockService.swift
//  FoodRecipesAppTests
//
//  Created by Abdelrahman Ahmed Shawky  on 16/10/2021.
//

import Foundation
import RxSwift

struct MockService : Networkable {
    
    let mockData: [RecipeItemModel]?

    init(mockData: [RecipeItemModel]?) {
        self.mockData = mockData
    }
    
    func request<T>(endPoint: RecipeService) -> Observable<T> {
        
        return .create { observer in
            observer.onNext(mockData as! T)
            observer.onCompleted()
            return Disposables.create()
        }
    }
    
}
