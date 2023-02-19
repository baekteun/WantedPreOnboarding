import Combine
import UIKit

open class BaseViewController: UIViewController, BoundsProvidable {

    // MARK: - Properties
    private let viewDidLoadSubject = PassthroughSubject<Void, Never>()
    private let viewWillAppearSubject = PassthroughSubject<Void, Never>()
    private let viewDidAppearSubject = PassthroughSubject<Void, Never>()
    private let viewWillDisappearSubject = PassthroughSubject<Void, Never>()
    private let viewDidDisappearSubject = PassthroughSubject<Void, Never>()
    public var bag = Set<AnyCancellable>()

    // MARK: - Lifecycle

    open override func viewDidLoad() {
        super.viewDidLoad()
        viewDidLoadSubject.send(())
        addView()
        setLayout()
        configureViewController()
        bind()
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewWillAppearSubject.send(())
    }

    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewDidAppearSubject.send(())
    }

    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewWillDisappearSubject.send(())
    }

    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewDidDisappearSubject.send(())
    }

    // MARK: - Override

    open func addView() { }

    open func setLayout() { }

    open func configureViewController() {
        self.view.backgroundColor = .white
    }

    open func bind() { }
}

extension BaseViewController: LifecyclePublishable {
    public var viewDidLoadPublisher: AnyPublisher<Void, Never> {
        self.viewDidLoadSubject.eraseToAnyPublisher()
    }
    
    public var viewWillAppearPublisher: AnyPublisher<Void, Never> {
        self.viewWillAppearSubject.eraseToAnyPublisher()
    }
    
    public var viewDidAppearPublisher: AnyPublisher<Void, Never> {
        self.viewDidAppearSubject.eraseToAnyPublisher()
    }
    
    public var viewWillDisappearPublisher: AnyPublisher<Void, Never> {
        self.viewWillDisappearSubject.eraseToAnyPublisher()
    }
    
    public var viewDidDisappearPublisher: AnyPublisher<Void, Never> {
        self.viewDidDisappearSubject.eraseToAnyPublisher()
    }
}
