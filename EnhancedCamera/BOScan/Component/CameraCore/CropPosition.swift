//
//  CropPosition.swift
//
//
//  Created by Raja on 04/07/23.
//

import Foundation

public enum ObjectCaptureStatus: String {
    case inner = "bo_tooClose"
    case outer = "bo_align"
    case match = "bo_holdTight"
    case tooFar = "bo_moveCloser"
    var value: String {
        return self.rawValue
    }
}
