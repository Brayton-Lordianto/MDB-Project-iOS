//
//  DraggableImageView.swift
//  MDB-Project
//
//  Created by Brayton Lordianto and Amol Budhiraja on 9/30/24.
//

import SwiftUI

class DraggableImageView: UIImageView {
    var beganPoint: CGPoint? = nil
    var originCenter: CGPoint? = nil
    
    override init(image: UIImage?) {
        super.init(image: image)
        setupGestureRecognizers()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupGestureRecognizers()
    }
    
    private func setupGestureRecognizers() {
        center = .init(x: 200, y: 200)
        
        let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        let rotateGestureRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation(_:)))
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))

        self.addGestureRecognizer(pinchGestureRecognizer)
        self.addGestureRecognizer(rotateGestureRecognizer)
        self.addGestureRecognizer(longPressGestureRecognizer) // Add long press gesture recognizer
    }
    
    @objc func handlePinch(_ gestureRecognizer: UIPinchGestureRecognizer) {
        let scale = gestureRecognizer.scale
        self.transform = self.transform.scaledBy(x: scale, y: scale)
        gestureRecognizer.scale = 1.0
        center = gestureRecognizer.location(in: superview)
    }
    
    @objc func handleRotation(_ gestureRecognizer: UIRotationGestureRecognizer) {
        let angle = gestureRecognizer.rotation
        print(angle)
        self.transform = self.transform.rotated(by: angle)
        gestureRecognizer.rotation = 0
    }
    
    @objc func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .began {
            self.removeFromSuperview()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("began")
        if let position = touches.first?.location(in: superview) {
            beganPoint = position
            originCenter = center
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        
        if let position = touch?.location(in: superview),
           let beganX = beganPoint?.x,
           let beganY = beganPoint?.y,
           let originX = originCenter?.x,
           let originY = originCenter?.y {
            let newPosition = CGPoint(x: position.x - beganX, y: position.y - beganY)
            center = CGPoint(x: originX + newPosition.x, y: originY + newPosition.y)
        }
    }
}
