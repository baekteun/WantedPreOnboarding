import UIKit
import MainFeatureInterface

public struct MainFeatureFactoryImpl: MainFeatureFactory {
    public init() { }

    public func makeViewController() -> UIViewController {
        let viewModel = MainViewModel()
        return MainViewController(viewModel: viewModel)
    }
}
