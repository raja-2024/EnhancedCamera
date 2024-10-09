//
//  ViewController.swift
//  EnhancedCamera
//
//  Created by Raja on 09/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cameraView: BOScanView!
    @IBOutlet weak var advancedlayout: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //capture whole preivew
        cameraView.startScan(cropRect: cameraView.bounds)
        cameraView.delegate = self
        advancedlayout.isHidden = true
    }

    @IBAction func captureAction(_ sender: Any) {
        cameraView.capturePhoto()
    }
    
    @IBAction func flashAction(_ sender: UIButton) {
        sender.tag = sender.tag == 0 ? 1 : 0
        sender.backgroundColor = sender.tag == 1 ? .systemYellow : .white
        cameraView.changeFlash(mode: sender.tag == 1 ? .on : .off)
    }
    
    @IBAction func advancedAction(_ sender: UIButton) {
        sender.tag = sender.tag == 0 ? 1 : 0
        sender.setTitle(sender.tag == 1 ? "Advanced" : "Normal", for: .normal)
        advancedlayout.isHidden = sender.tag == 0
        if advancedlayout.isHidden {
            cameraView.camera?.setExposure(targetBias: 0)
        }
    }
    
    @IBAction func setCustomExposure(_ sender: UISlider) {
        cameraView.camera?.setExposure(targetBias: Double(sender.value))
    }
    
}

// MARK: BOCameraViewDelegate
extension ViewController: BOCameraViewDelegate {
    
    func cameraView(didCapture image: UIImage?) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: "ImageReviewController") as! ImageReviewController
        controller.capturedImage = image
        navigationController?.pushViewController(controller, animated: true)
    }
}
