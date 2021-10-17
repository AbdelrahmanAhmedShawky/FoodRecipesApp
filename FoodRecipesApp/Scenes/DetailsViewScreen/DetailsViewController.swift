import Foundation
import UIKit
import RxSwift
import RxCocoa
import Kingfisher
import Swinject

class DetailsViewController:UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionsLabel: UILabel!
    @IBOutlet weak var addToFavoritesButton: UIButton!
    
    @IBOutlet weak var recipeImage: UIImageView!
        
    var viewModel: DetailsViewModel?
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI(item: viewModel?.recipeItem)
        
    }
    
    private func setupUI(item:RecipeItemModel?) {
        
        self.title = "Details"
        
        viewModel?.isFavorite.subscribe(onNext: { [weak self] isFavorite in
            if isFavorite ?? false {
                self?.addToFavoritesButton.setTitle("delete from favorites", for: .normal)
            } else {
                self?.addToFavoritesButton.setTitle("Add to favorites", for: .normal)
            }
        }).disposed(by: disposeBag)
        
        addToFavoritesButton.layer.cornerRadius = 15
        addToFavoritesButton.layer.borderWidth = 1
        addToFavoritesButton.layer.borderColor = UIColor.clear.cgColor
        nameLabel.text = item?.name
        descriptionsLabel.text = item?.descriptions
        
        let imageUrl = URL(string: item?.image ?? "")
        self.recipeImage.kf.setImage(with: imageUrl!)
        
        addToFavoritesButton.rx.tap.subscribe(onNext: { [weak self] _ in
            if self?.addToFavoritesButton.titleLabel?.text == "delete from favorites" {
                self?.viewModel?.deleteFavoritesItem(item: item)
            } else {
                self?.viewModel?.addFavoritesItem(item: item)
            }
           
        }).disposed(by: disposeBag)
        
    }
    
}
