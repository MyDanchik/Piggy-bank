import UIKit
import PhotosUI

final class AddDiscountViewModel {
    
    var setupAlert: ((UIAlertController) -> Void)?
    var setupUIImagePicker: ((UIImagePickerController) -> Void)?
    
    func tapOnALertButton() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: NSLocalizedString("App.AddDiscountView.TapOnALertButton.camera", comment: ""), style: .default, handler: { _ in
            self.openCamera()
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("App.AddDiscountView.TapOnALertButton.gallery", comment: ""), style: .default, handler: { _ in
            self.openGallery()
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("App.AddDiscountView.TapOnALertButton.cancel", comment: ""), style: .cancel, handler: { _ in
        }))
        setupAlert?(alert)
    }
    
    func openGallery() {
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
