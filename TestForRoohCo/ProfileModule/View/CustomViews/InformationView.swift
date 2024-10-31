import UIKit

final class InformationView: UIView {
    // MARK: - Properties
    
    // MARK: Private
    
    private let informationLabel: UILabel = UILabel()
    
    private let nameField: InfoField = InfoField()
    
    private let dateField: InfoField = InfoField()
    
    private let weightField: InfoField = InfoField()

    // MARK: - Initialisation
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        assemblyInterface()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - API
    
    func getName() -> String {
        nameField.text
    }
    
    func getDate() -> String {
        dateField.text
    }
    
    func getWeight() -> String {
        weightField.text
    }
    
    func isEmpty() -> Bool {
        if nameField.text.isEmpty || dateField.text.isEmpty || weightField.text.isEmpty {
            return true
        } else {
            return false
        }
    }
}

// MARK: - AutoLayout & Setups

extension InformationView {
    // MARK: - Assembly Interface
    
    private func assemblyInterface() {
        addSubviews()
        setupConstraints()
        setupViews()
    }
    
    // MARK: - Constraints
    
    // MARK: Private
    
    private func setupConstraints() {
        // informationLabel
        
        informationLabel.translatesAutoresizingMaskIntoConstraints = false
        informationLabel
            .topAnchor
            .constraint(equalTo: topAnchor,
                        constant: InformationViewUIConstant.baseIdent).isActive = true
        informationLabel
            .leadingAnchor
            .constraint(equalTo: leadingAnchor,
                        constant: InformationViewUIConstant.baseIdent).isActive = true
        
        // fields
        
        [nameField, dateField, weightField].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.leadingAnchor
                .constraint(equalTo: leadingAnchor,
                            constant: InformationViewUIConstant.baseIdent).isActive = true
            $0.trailingAnchor
                .constraint(equalTo: trailingAnchor,
                            constant: -InformationViewUIConstant.baseIdent).isActive = true
            $0.heightAnchor
                .constraint(equalToConstant: InformationViewUIConstant.baseHeightForField).isActive = true
        }
        
        // nameField
        
        nameField
            .topAnchor
            .constraint(equalTo: informationLabel.bottomAnchor,
                        constant: InformationViewUIConstant.baseIdent).isActive = true

        // dateField
        
        dateField
            .topAnchor
            .constraint(equalTo: nameField.bottomAnchor,
                        constant: InformationViewUIConstant.baseIdent).isActive = true
        
        // weightField
        
        weightField
            .topAnchor
            .constraint(equalTo: dateField.bottomAnchor,
                        constant: InformationViewUIConstant.baseIdent).isActive = true
    }
    
    // MARK: - Setups
    
    // MARK: Private
    
    private func addSubviews() {
        addSubviews(informationLabel,
                    nameField,
                    dateField,
                    weightField)
    }
    
    private func setupViews() {
        setupInformationLabel()
        setupFields()
    }
    
    private func setupInformationLabel() {
        informationLabel.text = AppCaption.information
        informationLabel.textColor = .black
        informationLabel.font = .systemFont(ofSize: InformationViewUIConstant.fontOfSizeForInformationLabel,
                                            weight: .regular)
    }
    
    private func setupFields() {
        // nameField
        nameField.setup(text: AppCaption.name, image: .AppImage.personCropCircle)
        
        // dateField
        dateField.setup(text: AppCaption.date, image: .AppImage.calendar)
        dateField.setToDatePickerMode()
        
        // weightField
        weightField.setup(text: AppCaption.weight, image: .AppImage.scalemass)
        weightField.showNumpad()
    }
}
