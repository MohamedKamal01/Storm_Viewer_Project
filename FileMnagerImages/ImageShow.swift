//
//  ImageShow.swift
//  FileMnagerImages
//
//  Created by Mohamed Kamal on 04/02/2022.
//

import UIKit

class ImageShow: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var selectedImage : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedImage
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        if let image = selectedImage{
            imageView.image = UIImage.init(named: image)
        }
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    @objc func shareTapped()
    {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8)
                else
                {
                    print("Image Not Found")
                    return
                }
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc , animated: true)
    }

}
