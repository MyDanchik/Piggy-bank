import UIKit
import PhotosUI

final class AddDiscountViewModel {
    
    var setupAlert: ((UIAlertController) -> Void)?
    var setupUIImagePicker: ((UIImagePickerController) -> Void)?
    
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
        let imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
        } else { }
        setupUIImagePicker?(imagePicker)
    }
    
    func openCamera() {
        let imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
        } else { }
        setupUIImagePicker?(imagePicker)
    }
    
    func saveNewDiscount(imageFrontDiscount: Data?, imageBackDiscount: Data?, nameDiscount: String?) {
        guard let imageFrontDiscount = imageFrontDiscount,
              let imageBackDiscount = imageBackDiscount,
              let nameDiscount = nameDiscount, !nameDiscount.isEmpty else {
            let alertEmpty = UIAlertController(title: NSLocalizedString("Bank.alertEmpty", comment: ""), message: "", preferredStyle: .alert)
            alertEmpty.addAction(UIAlertAction(title: NSLocalizedString("Bank.alertOK", comment: ""), style: .destructive, handler: nil))
            return
        }
        
        let result = CoreDataManager.instance.saveDiscounts(imageFrontDiscount: imageFrontDiscount, imageBackDiscount: imageBackDiscount, nameDiscount: nameDiscount)
        
        switch result {
        case .success:
            print("Bank saved successfully")
            
        case .failure(let failure):
            print("Failed to save Bank: \(failure)")
        }
    }
}
