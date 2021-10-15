import UIKit

@IBDesignable
class BaseView: UIView {
    
    @IBOutlet weak var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    func commonInit() {
        Bundle(for: classForCoder).loadNibNamed("\(type(of: self))", owner: self, options: nil)
        addSubview(view)
        view.frame = bounds
    }
}
