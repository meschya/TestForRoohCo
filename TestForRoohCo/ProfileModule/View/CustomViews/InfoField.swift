import UIKit

final class InfoField: UIStackView {
    // MARK: - Properties
    
    // MARK: Public
    
    var text: String  {
        get {
            return textField.text ?? AppCaption.notFound
        }
        set {
            textField.text = newValue
        }
    }
    
    // MARK: Private
    
    private let iconImageView: UIImageView = .init()
    
    private let label: UILabel = .init()
    
    private let textField: UITextField = .init()
    
    private var datePicker: UIDatePicker = .init()
    
    // MARK: - Initialisation
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        assemblyInterface()
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - API
    
    func setup(text: String, image: UIImage) {
        label.text = text
        iconImageView.image = image
    }
    
    func showNumpad() {
        textField.keyboardType = UIKeyboardType.numberPad
    }
    
    func setToDatePickerMode() {
        datePicker = UIDatePicker.init(frame: CGRect(x: .zero, 
                                                     y: .zero,
                                                     width: UIScreen.main.bounds.width,
                                                     height: 200))
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self,
                             action: #selector(self.dateChanged),
                             for: .allEvents)
        textField.inputView = datePicker
        let doneButton = UIBarButtonItem.init(title: "Done", 
                                              style: .done,
                                              target: self,
                                              action: #selector(self.datePickerDone))
        let toolBar = UIToolbar.init(frame: CGRect(x: .zero,
                                                   y: .zero,
                                                   width: UIScreen.main.bounds.width,
                                                   height: 44))
        toolBar.setItems([UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, 
                                          target: nil,
                                          action: nil), doneButton],
                         animated: true)
        textField.inputAccessoryView = toolBar
    }
}

// MARK: - AutoLayout & Setups

extension InfoField {
    // MARK: - Assembly Interface
    
    private func assemblyInterface() {
        addSubviews()
        setupConstraints()
        setupViews()
    }
    
    // MARK: - Constraints
    
    // MARK: Private
    
    private func setupConstraints() {
        // iconImageView
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView
            .heightAnchor
            .constraint(equalToConstant: InfoFieldUIConstant.sizeForIconImageView)
            .isActive = true
        iconImageView
            .widthAnchor
            .constraint(equalToConstant: InfoFieldUIConstant.sizeForIconImageView)
            .isActive = true
        
        // label
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label
            .widthAnchor
            .constraint(equalToConstant: InfoFieldUIConstant.widthForLabel).isActive = true
    }
    
    // MARK: - Setups
    
    // MARK: Private
    
    private func addSubviews() {
        addArrangedSubviews(iconImageView,
                            label,
                            textField)
    }
    
    private func setupViews() {
        setupStackView()
        setupIconImageView()
        setupLabel()
        setupTextField()
    }
    
    private func setupStackView() {
        spacing = InfoFieldUIConstant.spacingForStackView
    }
    
    private func setupIconImageView() {
        iconImageView.tintColor = AppColor.darkGray
        iconImageView.contentMode = .scaleAspectFill
    }
    
    private func setupLabel() {
        label.textColor = AppColor.darkGray
        label.font = .systemFont(ofSize: InfoFieldUIConstant.fontOfSizeForLabel,
                                 weight: .regular)
    }
    
    private func setupTextField() {
        textField.layer.borderWidth = InfoFieldUIConstant.borderWidthForTextField
        textField.layer.borderColor = AppColor.darkGray.cgColor
        textField.layer.cornerRadius = InfoFieldUIConstant.cornerRadiusForTextField
        let spacerView = UIView(frame: CGRect(x: .zero,
                                              y: .zero,
                                              width: InfoFieldUIConstant.sizeForSpacerView,
                                              height: InfoFieldUIConstant.sizeForSpacerView))
        textField.leftViewMode = .always
        textField.rightViewMode = .always
        textField.leftView = spacerView
        textField.rightView = spacerView
    }
    
    // MARK: - Actions
    
    @objc private func datePickerDone() {
        textField.resignFirstResponder()
    }

    @objc private func dateChanged() {
        if let datePicker = self.textField.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.dateFormat = "dd/mm/yy"
            textField.text = dateFormatter.string(from: datePicker.date)
        }
        textField.resignFirstResponder()
    }
}
