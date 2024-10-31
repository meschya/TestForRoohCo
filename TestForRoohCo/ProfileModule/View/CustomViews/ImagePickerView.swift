import UIKit

final class ImagePickerView: UIView {
    // MARK: - Properties
    
    // MARK: Public
    
    var pickedPhoto: ((UIImage) -> ())?
    
    // MARK: Private
    
    private var images: [UIImage]?
    
    private let infoLabel: UILabel = .init()
    
    private let collectionView: UICollectionView = .init(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    private let layout = UICollectionViewFlowLayout()
    
    private var centerCell: PickerImageCollectionViewCell?
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        assemblyInterface()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - API
    
    func set() {
        let layoutMargins: CGFloat = self.collectionView.layoutMargins.left + self.collectionView.layoutMargins.right
        let sideIdent = (self.frame.width / 2) - layoutMargins
        self.collectionView.contentInset = UIEdgeInsets(top: .zero, left: sideIdent, bottom: .zero, right: sideIdent)
    }
    
    func set(images: [UIImage]) {
        self.images = images
    }
}

// MARK: - AutoLayout & Setups

extension ImagePickerView {
    // MARK: - Assembly Interface
    
    private func assemblyInterface() {
        addSubviews()
        setupConstraints()
        setupViews()
    }
    
    // MARK: - Constraints
    
    // MARK: Private
    
    private func setupConstraints() {
        // infoLabel
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel
            .topAnchor
            .constraint(equalTo: topAnchor)
            .isActive = true
        infoLabel
            .centerXAnchor
            .constraint(equalTo: centerXAnchor)
            .isActive = true
        
        // collectionView
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView
            .bottomAnchor
            .constraint(equalTo: bottomAnchor)
            .isActive = true
        collectionView
            .leadingAnchor
            .constraint(equalTo: leadingAnchor)
            .isActive = true
        collectionView
            .trailingAnchor
            .constraint(equalTo: trailingAnchor)
            .isActive = true
        collectionView
            .heightAnchor
            .constraint(equalToConstant: ImagePickerUIConstant.heightForCollectionView)
            .isActive = true
    }
    
    // MARK: - Setups
    
    // MARK: Private
    
    private func addSubviews() {
        addSubviews(infoLabel,
                    collectionView)
    }
    
    private func setupViews() {
        setupInfoLabel()
        setupCollectionView()
    }
    
    private func setupInfoLabel() {
        infoLabel.text = AppCaption.infoPicker
        infoLabel.textColor = .black
        infoLabel.font = .systemFont(ofSize: ImagePickerUIConstant.fontOfSizeForInfoLabel, weight: .light)
        infoLabel.textAlignment = .center
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PickerImageCollectionViewCell.self, forCellWithReuseIdentifier: PickerImageCollectionViewCell.identifier)
        collectionView.backgroundColor = .white
        collectionView.layer.cornerRadius = ImagePickerUIConstant.cornerRadiusForCollectionView
        collectionView.layer.borderWidth = ImagePickerUIConstant.borderWidthForCollectionView
        collectionView.layer.borderColor = AppColor.gray.cgColor
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.collectionViewLayout = layout
        layout.scrollDirection = .horizontal
        layout.sectionInset = ImagePickerUIConstant.sectionInset
        layout.itemSize = ImagePickerUIConstant.itemSize
    }
}

extension ImagePickerView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images?.count ?? .zero
     }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PickerImageCollectionViewCell.identifier, for: indexPath) as? PickerImageCollectionViewCell {
            let image = images?[indexPath.row]
            cell.setup(image: image)
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView is UICollectionView else { return }
        
        let centerPoint = CGPoint(x: self.collectionView.frame.size.width / 2 + scrollView.contentOffset.x,
                                  y: self.collectionView.frame.size.height / 2 + scrollView.contentOffset.y)
        
        if let indexPath = self.collectionView.indexPathForItem(at: centerPoint) {
            self.centerCell = (self.collectionView.cellForItem(at: indexPath) as! PickerImageCollectionViewCell)
            self.centerCell?.transformToLarge()
            let image = self.images?[indexPath.row] ?? .AppImage.avatar_1
            self.pickedPhoto?(image)
        }
        
        if let cell = self.centerCell {
            let offsetX = centerPoint.x - cell.center.x
            
            if offsetX < -15 || offsetX > 15 {
                cell.transformToStandard()
                self.centerCell = nil
            }
        }
    }
}
