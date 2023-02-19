import BaseFeature
import CombineUtil
import UIKit

final class MainViewController: BaseViewController<MainViewModel> {

    // MARK: - Properties

    private let imageLoadStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 15
        return stackView
    }()
    private let imageLoadViews = Array(repeating: "https://cataas.com/cat", count: 5)
        .compactMap { URL(string: $0) }
        .map { MainImageView(url: $0) }
    private let loadAllImageButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle("Load All Images", for: .normal)
        return button
    }()

    // MARK: - UI

    override func addView() {
        view.addSubViews(imageLoadStackView, loadAllImageButton)
        imageLoadViews.forEach { imageLoadStackView.addArrangedSubViews($0) }
    }

    override func setLayout() {
        NSLayoutConstraint.activate([
            imageLoadStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            imageLoadStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            imageLoadStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            loadAllImageButton.topAnchor.constraint(equalTo: imageLoadStackView.bottomAnchor, constant: 10),
            loadAllImageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loadAllImageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        imageLoadViews.forEach { $0.heightAnchor.constraint(equalToConstant: 90).isActive = true }
    }

    override func bind() {
        loadAllImageButton.tapPublisher
            .sink { [weak self] _ in
                self?.imageLoadViews.forEach { $0.loadImage() }
            }
            .store(in: &bag)
    }
}
