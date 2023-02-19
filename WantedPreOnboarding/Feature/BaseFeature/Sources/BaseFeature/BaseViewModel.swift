import Combine

open class BaseViewModel {

    // MARK: - Properties

    public var bag = Set<AnyCancellable>()

    // MARK: - Init

    public init() { }
}
