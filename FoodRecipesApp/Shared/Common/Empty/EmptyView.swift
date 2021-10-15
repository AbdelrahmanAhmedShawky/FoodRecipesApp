import UIKit
import RxSwift
import RxCocoa

class EmptyView: BaseView {
    
    struct Data {
        
        let imageName: String
        let text: String
    }
    
    @IBOutlet private weak var textLabel: UILabel!
    
    private let disposeBag = DisposeBag()
    
    let data = PublishRelay<Data>()
    
    override func commonInit() {
        super.commonInit()
        
        data
            .map { $0.text }
            .bind(to: textLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
