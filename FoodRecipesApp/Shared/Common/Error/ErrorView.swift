import UIKit
import RxSwift
import RxCocoa

class ErrorView: BaseView {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var labelMessage: UILabel!
    @IBOutlet private weak var labelActionText: UILabel!
    
    private let disposeBag = DisposeBag()
    
    let error = PublishRelay<String>()
    
    override func commonInit() {
        super.commonInit()
    
        error
            .map { $0 }
            .bind(to: labelMessage.rx.text)
            .disposed(by: disposeBag)
    }
}
