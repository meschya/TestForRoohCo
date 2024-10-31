import UIKit

final class ProfileViewController: UIViewController {
    // MARK: - Properties
    
    // MARK: Public
    
    public let viewModel: ProfileViewModel = ProfileViewModel()
    
    // MARK: Private
    
    private let backgroundHeaderImageView: UIImageView = UIImageView()
    
    private let profileImageView: CircleImageView = .init(frame: .zero)
    
    private let pickerViewBackgroundView: UIView = UIView()
     
    private let imagePickerView: ImagePickerView = ImagePickerView()
    
    private let sendButton: UIButton = UIButton()
    
    private let informationView: InformationView = InformationView()
    
    private let buttonTarget = ButtonTarget()
    
    private let watchConnector = WatchConnector()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assemblyInterface()
        hideKeyboardWhenTappedAround()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        imagePickerView.set()
    }
}

// MARK: - AutoLayout & Setups

extension ProfileViewController {
    // MARK: - Assembly Interface
    
    private func assemblyInterface() {
        addSubviews()
        setupConstraints()
        setupViews()
    }
    
    // MARK: - Constraints
    
    // MARK: Private
    
    private func setupConstraints() {
        // backgroundHeaderImageView
        
        backgroundHeaderImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundHeaderImageView
            .topAnchor
            .constraint(equalTo: view.topAnchor)
            .isActive = true
        backgroundHeaderImageView
            .leadingAnchor
            .constraint(equalTo: view.leadingAnchor)
            .isActive = true
        backgroundHeaderImageView
            .trailingAnchor
            .constraint(equalTo: view.trailingAnchor)
            .isActive = true
        backgroundHeaderImageView
            .heightAnchor
            .constraint(equalToConstant: ProfileVCUIConstants.heightForBackgroundHeaderImageView)
            .isActive = true
        
        // pickerViewBackGroundView
        
        pickerViewBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        pickerViewBackgroundView
            .topAnchor
            .constraint(equalTo: profileImageView.topAnchor)
            .isActive = true
        pickerViewBackgroundView
            .leadingAnchor
            .constraint(equalTo: view.leadingAnchor)
            .isActive = true
        pickerViewBackgroundView
            .trailingAnchor
            .constraint(equalTo: view.trailingAnchor)
            .isActive = true
        pickerViewBackgroundView
            .heightAnchor
            .constraint(equalToConstant: ProfileVCUIConstants.heightPickerViewBackgroundView)
            .isActive = true
        
        // profileImageView
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView
            .heightAnchor
            .constraint(equalToConstant: ProfileVCUIConstants.sizeForProfileImageView)
            .isActive = true
        profileImageView
            .widthAnchor
            .constraint(equalToConstant: ProfileVCUIConstants.sizeForProfileImageView)
            .isActive = true
        profileImageView
            .centerXAnchor
            .constraint(equalTo: view.centerXAnchor)
            .isActive = true
        profileImageView
            .centerYAnchor
            .constraint(equalTo: backgroundHeaderImageView.bottomAnchor)
            .isActive = true
        
        // imagePickerView
        
        imagePickerView.translatesAutoresizingMaskIntoConstraints = false
        imagePickerView
            .topAnchor
            .constraint(equalTo: profileImageView.bottomAnchor,
                        constant: ProfileVCUIConstants.baseIdent)
            .isActive = true
        imagePickerView
            .leadingAnchor
            .constraint(equalTo: pickerViewBackgroundView.leadingAnchor, constant: ProfileVCUIConstants.identForPickerView)
            .isActive = true
        imagePickerView
            .trailingAnchor
            .constraint(equalTo: pickerViewBackgroundView.trailingAnchor, constant: -ProfileVCUIConstants.identForPickerView)
            .isActive = true
        imagePickerView
            .bottomAnchor
            .constraint(equalTo: pickerViewBackgroundView.bottomAnchor,
                        constant: -ProfileVCUIConstants.baseIdentForPickerView)
            .isActive = true
        
        // sendButton
        
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton
            .bottomAnchor
            .constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                        constant: -ProfileVCUIConstants.baseIdent).isActive = true
        sendButton
            .leadingAnchor
            .constraint(equalTo: view.leadingAnchor,
                        constant: ProfileVCUIConstants.baseIdent).isActive = true
        sendButton
            .trailingAnchor
            .constraint(equalTo: view.trailingAnchor,
                        constant: -ProfileVCUIConstants.baseIdent).isActive = true
        sendButton
            .heightAnchor
            .constraint(equalToConstant: ProfileVCUIConstants.heightForSendButton)
            .isActive = true
        
        // informationView
        
        informationView.translatesAutoresizingMaskIntoConstraints = false
        informationView
            .topAnchor
            .constraint(equalTo: pickerViewBackgroundView.bottomAnchor,
                        constant: ProfileVCUIConstants.baseIdent).isActive = true
        informationView
            .leadingAnchor
            .constraint(equalTo: view.leadingAnchor)
            .isActive = true
        informationView
            .trailingAnchor
            .constraint(equalTo: view.trailingAnchor)
            .isActive = true
        informationView
            .bottomAnchor
            .constraint(equalTo: sendButton.topAnchor,
                        constant: -ProfileVCUIConstants.baseIdent).isActive = true
    }
    
    // MARK: - Setups
    
    // MARK: Private
    
    private func addSubviews() {
        view.addSubviews(pickerViewBackgroundView,
                         backgroundHeaderImageView,
                         profileImageView,
                         imagePickerView,
                         sendButton,
                         informationView
                         )
    }
    
    private func setupViews() {
        setupImagePickerView()
        setupPickerViewBackgroundView()
        setupBackgroundHeaderImageView()
        setupSuperView()
        setupProfileImageView()
        setupSendButton()
        setupinformationView()
    }
    
    private func setupSuperView() {
        view.backgroundColor = AppColor.gray
    }
    
    private func setupPickerViewBackgroundView() {
        pickerViewBackgroundView.backgroundColor = .white
        pickerViewBackgroundView.layer.cornerRadius = ProfileVCUIConstants.cornerRadiusForBackgroundHeaderImageView
    }
    
    private func setupBackgroundHeaderImageView() {
        backgroundHeaderImageView.image = .AppImage.background
        backgroundHeaderImageView.contentMode = .scaleAspectFill
        backgroundHeaderImageView.layer.cornerRadius = ProfileVCUIConstants.cornerRadiusForBackgroundHeaderImageView
        backgroundHeaderImageView.clipsToBounds = true
    }
    
    private func setupProfileImageView() {
        profileImageView.image = .AppImage.avatar_1
        profileImageView.backgroundColor = AppColor.gray
    }
    
    private func setupImagePickerView() {
        imagePickerView.set(images: viewModel.dataImages)
        imagePickerView.pickedPhoto = { [weak self] image in self?.profileImageView.image = image }
    }
    
    private func setupSendButton() {
        sendButton.backgroundColor = .black
        sendButton.layer.cornerRadius = ProfileVCUIConstants.cornerRadiusForSendButton
        sendButton.setTitle(AppCaption.send,
                            for: .normal)
        sendButton.titleLabel?.font = .systemFont(ofSize: ProfileVCUIConstants.fontOfSizeForSendButton,
                                                  weight: .regular)
        sendButton.setTitleColor(.white,
                                 for: .normal)
        buttonTarget.add(control: sendButton) { [weak self] in
            if self?.informationView.isEmpty() == true {
                self?.present(Alert.ok(title: AppCaption.error,
                                 message: AppCaption.attentionEmptyInfo), animated: true)
            } else {
                let person = Person(name: self?.informationView.getName() ?? AppCaption.notFound,
                                    age: self?.informationView.getDate() ?? AppCaption.notFound,
                                    weight: self?.informationView.getWeight() ?? AppCaption.notFound,
                                    image: (self?.profileImageView.image)!)
                print(person)
            }
        }
    }
    
    private func setupinformationView() {
        informationView.backgroundColor = .white
        informationView.layer.cornerRadius = ProfileVCUIConstants.cornerRadiusForBackgroundHeaderImageView
    }
    
    // MARK: - Helpers
    
    private func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
