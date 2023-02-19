import UIKit
import MainFeatureInterface

public struct MainFeatureFactoryImpl: MainFeatureFactory {
    public init() { }

    public func makeViewController() -> UIViewController {
        MainViewController()
    }
}
