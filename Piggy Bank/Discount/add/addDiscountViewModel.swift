import UIKit
import PhotosUI

protocol AddDiscountViewModel {
    func tapOnALertButton()
    func openGalery()
    func openCamera()
    var setupAlert: ((UIAlertController) -> Void)? { get set }
    var setupPHPicker: ((PHPickerViewController) -> Void)? { get set }
    var setupUIImagePicker: ((UIImagePickerController) -> Void)? { get set }
    func saveNewDiscount(imageFrontDiscount: Data?, nameDiscount: String?)
}

final class DefaultAddDiscountViewModel: AddDiscountViewModel {
    
    var setupAlert: ((UIAlertController) -> Void)?
    var setupUIImagePicker: ((UIImagePickerController) -> Void)?
    var setupPHPicker: ((PHPickerViewController) -> Void)?

    func tapOnALertButton() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: NSLocalizedString("addBirthdaysPage.tapOnALertButton.camera", comment: ""), style: .default, handler: { _ in
            self.openCamera()
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("addBirthdaysPage.tapOnALertButton.galery", comment: ""), style: .default, handler: { _ in
            self.openGalery()
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("addBirthdaysPage.tapOnALertButton.cancel", comment: ""), style: .cancel, handler: { _ in
        }))
        setupAlert?(alert)
    }
    
    func openGalery() {
        var configurator = PHPickerConfiguration(photoLibrary: .shared())
        configurator.filter = .images
        configurator.selectionLimit = 1
        let picker = PHPickerViewController(configuration: configurator)
        setupPHPicker?(picker)
    }
    
    func openCamera() {
        let imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
        } else { }
        setupUIImagePicker?(imagePicker)
    }


    func saveNewDiscount(imageFrontDiscount: Data?, nameDiscount: String?) {
        guard let imageFrontDiscount = imageFrontDiscount,
              let nameDiscount = nameDiscount, !nameDiscount.isEmpty else {
            let alertEmpty = UIAlertController(title: NSLocalizedString("Bank.alertEmpty", comment: ""), message: "", preferredStyle: .alert)
            alertEmpty.addAction(UIAlertAction(title: NSLocalizedString("Bank.alertOK", comment: ""), style: .destructive, handler: nil))
            return
        }
        
        let result = CoreDataManager.instance.saveDiscounts(imageFrontDiscount: imageFrontDiscount, nameDiscount: nameDiscount)
        
        switch result {
        case .success:
            print("Bank saved successfully")

        case .failure(let failure):
            print("Failed to save Bank: \(failure)")
        }
    }
}
