import UIKit

open class BaseViewController: UIViewController {

    // MARK: - Lifecycle

    open override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        setLayout()
        configureViewController()
        bind()
    }

    // MARK: - Override

    open func addView() { }

    open func setLayout() { }

    open func configureViewController() {
        self.view.backgroundColor = .white
    }

    open func bind() { }
}
