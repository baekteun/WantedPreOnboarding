import Combine
import Foundation
import UIKit.UIImage

public final class ImageDownloader {
    public static let shared = ImageDownloader()

    private init() {}

    public func loadImage(from url: URL) -> AnyPublisher<UIImage?, Never> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .map { UIImage(data: $0) }
            .catch { _ in Just(nil) }
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
