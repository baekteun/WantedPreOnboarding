import Combine
import CombineUtil
import ImageDownloader
import UIKit
import UIViewUtil

final class MainImageView: UIStackView {

    // MARK: - Properties

    private let url: URL
    private let imageView = UIImageView(image: .init(systemName: "photo"))
    private let progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.setProgress(0.5, animated: true)
        progressView.backgroundColor = .lightGray
        progressView.layer.cornerRadius = 1
        progressView.clipsToBounds = true
        return progressView
    }()
    private let loadButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle("Load", for: .normal)
        return button
    }()
    private var bag = Set<AnyCancellable>()

    // MARK: - Init

    init(url: URL) {
        self.url = url
        super.init(frame: .zero)
        setup()
        addView()
        setLayout()
        bind()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private

    private func setup() {
        self.axis = .horizontal
        self.alignment = .center
        self.distribution = .fillEqually
    }

    private func addView() {
        addArrangedSubViews(imageView, progressView, loadButton)
    }

    private func setLayout() {
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 60),
            imageView.widthAnchor.constraint(equalToConstant: 90)
        ])
    }

    private func bind() {
        loadButton.tapPublisher
            .handleEvents(receiveOutput: { [weak self] _ in
                guard let self = self else { return }
                self.imageView.image = .init(systemName: "photo")
            })
            .sink { [weak self] image in
                guard let self = self else { return }
                self.loadImage()
            }
            .store(in: &bag)
    }

    // MARK: - Public

    public func loadImage() {
        ImageDownloader.shared.loadImage(from: url)
            .handleEvents(receiveOutput: { [weak self] _ in
                guard let self = self else { return }
                self.imageView.image = .init(systemName: "photo")
            })
            .sink { [weak self] image in
                guard let self = self else { return }
                self.imageView.image = image
            }
            .store(in: &bag)
    }
}
