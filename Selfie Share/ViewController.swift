//
//  ViewController.swift
//  Selfie Share
//
//  Created by Артур Азаров on 13.08.2018.
//  Copyright © 2018 Артур Азаров. All rights reserved.
//

import UIKit

private let cellIdentifier = "ImageView"

class ViewController: UICollectionViewController {

    // MARK: - Properties
    
    private var images = [UIImage]()
    
    // MARK: - Actions
    
    @IBAction func importPicture(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Image picker controller delegate
extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image = info[UIImagePickerControllerEditedImage] as? UIImage else { return }
        dismiss(animated: true)
        images.insert(image, at: 0)
        collectionView?.reloadData()
    }
}

// MARK: - Collection view data source
extension ViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        if let imageView = cell.viewWithTag(1000) as? UIImageView {
            imageView.image = images[indexPath.item]
        }
        return cell
    }
}
