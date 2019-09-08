//
//  ViewController.swift
//  AnimalClassifierApp
//
//  Created by Molnár Csaba on 2019. 09. 08..
//  Copyright © 2019. Molnár Csaba. All rights reserved.
//

import UIKit

class ClassifierViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var classificationLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func cameraBtnWasPressed(_ sender: Any) {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            presentPhotoPicker(sourceType: .photoLibrary)
            return
        }
        
        let photoSourcepicker = UIAlertController()
        let takePhotoAction = UIAlertAction(title: "Take Photo", style: .default) { _ in
            self.presentPhotoPicker(sourceType: .camera)
        }
        
        let choosePhotoAction = UIAlertAction(title: "Choose Photo", style: .default) { _ in
            self.presentPhotoPicker(sourceType: .photoLibrary)
        }
        
        photoSourcepicker.addAction(takePhotoAction)
        photoSourcepicker.addAction(choosePhotoAction)
        photoSourcepicker.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(photoSourcepicker, animated: true, completion: nil)
    }
    
    func presentPhotoPicker(sourceType: UIImagePickerControllerSourceType){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = sourceType
        present(picker, animated: true, completion: nil)
    }
}

extension ClassifierViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true)
        print("pina")
        print(info)
        guard let image = info["UIImagePickerControllerOriginalImage"] as? UIImage else { fatalError("No image returned") }
        imageView.image = image
//            updateClassifications(for: image)
    }

    

}


