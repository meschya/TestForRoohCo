import UIKit

final class PickerImageCollectionViewCell: UICollectionViewCell {
    // MARK: - Identifier
    
    static let identifier = "ProfileImagesCollectionViewCell"
    
    // MARK: - Properties
    
    // MARK: Private
    
    private let mainImageView: UIImageView = UIImageView()
    
    // MARK: - Initialisation
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        assemblyInterface()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - API
    
    func setup(image: UIImage?) {
        mainImageView.image = image ?? .avatar1
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        transformToStandard()
    }
}

// MARK: - AutoLayout & Setups

extension PickerImageCollectionViewCell {
    // MARK: - Assembly Interface
    
    private func assemblyInterface() {
        addSubviews()
        setupConstraints()
        setupViews()
    }
    
    // MARK: - Constraints
    
    // MARK: Private
    
    private func setupConstraints() {
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView
            .topAnchor
            .constraint(equalTo: contentView.topAnchor)
            .isActive = true
        mainImageView
            .leadingAnchor
            .constraint(equalTo: contentView.leadingAnchor)
            .isActive = true
        mainImageView
            .trailingAnchor
            .constraint(equalTo: contentView.trailingAnchor)
            .isActive = true
        mainImageView
            .bottomAnchor
            .constraint(equalTo: contentView.bottomAnchor)
            .isActive = true
    }
    
    // MARK: - Setups
    
    // MARK: Private
    
    private func addSubviews() {
        contentView.addSubview(mainImageView)
    }
    
    private func setupViews() {
        mainImageView.contentMode = .scaleAspectFill
    }
    
    func transformToLarge() {
        UIView.animate(withDuration: 0.2) { [weak self] in
            self?.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
        }
        
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
    
    func transformToStandard() {
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform.identity
        }
    }
}
