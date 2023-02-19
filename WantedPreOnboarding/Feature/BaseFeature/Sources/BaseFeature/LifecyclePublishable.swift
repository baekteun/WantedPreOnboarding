import Combine

public protocol LifecyclePublishable {
    var viewDidLoadPublisher: AnyPublisher<Void, Never> { get }
    var viewWillAppearPublisher: AnyPublisher<Void, Never> { get }
    var viewDidAppearPublisher: AnyPublisher<Void, Never> { get }
    var viewWillDisappearPublisher: AnyPublisher<Void, Never> { get }
    var viewDidDisappearPublisher: AnyPublisher<Void, Never> { get }
}
