import Foundation
import UIKit
import RxSwift
import RxCocoa

class RecipeListViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewError: ErrorView!
    
    private let disposeBag = DisposeBag()
    var viewModel: RecipeListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Nutrition Analysis API Demo"
        setUpBindings()
        
        
    }
    
    private func setErrorViewVisible(_ visible: Bool) {
        
        visible ? view.bringSubviewToFront(viewError) : view.sendSubviewToBack(viewError)
    }
    
    private func setUpBindings() {
        guard let viewModel = viewModel  else {
            return
        }
        self.showLoading()
        viewModel.result.asObservable().bind(to: self.tableView.rx.items(cellIdentifier: "FoodRecipeCell", cellType: FoodRecipeCell.self)) { row, data, cell in
            self.hideLoading()
            self.setErrorViewVisible(false)
            cell.updateCell(item: data)
        }.disposed(by: disposeBag)
        
        self.tableView
            .rx
            .modelSelected(RecipeItemModel.self)
            .subscribe(onNext: { (user) in
                self.viewModel?.itemSelected.onNext(user)
            }).disposed(by: disposeBag)
       
        viewModel.error.subscribe(onNext: { error in
            self.hideLoading()
            self.setErrorViewVisible(true)
        }).disposed(by: disposeBag)
    }
    
    private func setupTableView() {
        
   
    }
}
