import Kingfisher
import UIKit

class FoodRecipeCell: UITableViewCell {
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodDescription: UILabel!
    
    func updateCell (item: RecipeItemModel) {
        let imageUrl = URL(string: item.image ?? "")
        self.foodImage.kf.setImage(with: imageUrl!)
        foodName.text = item.name
        foodDescription.text = item.descriptions
    }
    
}

