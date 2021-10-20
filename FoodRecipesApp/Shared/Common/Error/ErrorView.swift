import UIKit
import RxSwift
import RxCocoa

class ErrorView: BaseView {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var labelMessage: UILabel!
    @IBOutlet private weak var labelActionText: UILabel!
    @IBOutlet weak private var retryBtn: UIButton!
    
    private let disposeBag = DisposeBag()
    
    let error = PublishRelay<String>()
    let retryAction = PublishRelay<Void>()
    override func commonInit() {
        super.commonInit()
    
        error
            .map { $0 }
            .bind(to: labelMessage.rx.text)
            .disposed(by: disposeBag)
        
        retryBtn.rx.tap.subscribe(onNext: {[weak self] _ in
            self?.retryAction.accept(())
        }).disposed(by: disposeBag)
    }
}
