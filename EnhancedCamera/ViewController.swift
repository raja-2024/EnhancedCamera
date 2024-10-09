//
//  ViewController.swift
//  EnhancedCamera
//
//  Created by Raja on 09/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cameraView: BOScanView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraView.startScan(cropRect: .zero)
        cameraView.delegate = self
    }

    @IBAction func captureAction(_ sender: Any) {
        cameraView.capturePhoto()
    }
    
    @IBAction func flashAction(_ sender: UIButton) {
        sender.tag = sender.tag == 0 ? 1 : 0
        cameraView.changeFlash(mode: sender.tag == 0 ? .on : .off)
    }
    
}

// MARK: BOCameraViewDelegate
extension ViewController: BOCameraViewDelegate {
    
    func cameraView(didCapture image: UIImage?) {
        if let image = image {
            debugPrint("image \(image)")
        }
    }
}
