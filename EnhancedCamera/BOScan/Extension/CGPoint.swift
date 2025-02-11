//
//  CGPoint.swift
//
//
//  Created by Raja on 04/07/23.
//

import Foundation

extension CGPoint {
    func scaled(to size: CGSize) -> CGPoint {
        return CGPoint(x: self.x * size.width,
                       y: self.y * size.height)
    }
}
