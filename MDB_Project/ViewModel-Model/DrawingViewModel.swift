//
//  DrawingViewModel.swift
//  MDB-Project
//
//  Created by Brayton Lordianto on 9/30/24.
//

import Foundation
import UIKit
import PencilKit

struct DrawingModel {
    var canvas: PKCanvasView
    var name: String
    var isSelected: Bool = false
    var overlaidImages = [overlaidImage]()
    var idImage = UIImage()

    struct overlaidImage {
        var image: UIImage
        var center = CGPoint()
        var scale = CGAffineTransform(scaleX: 1, y: 1)
        var rotation = CGAffineTransform(rotationAngle: 0)
    }

    init() {
        self.canvas = .init()
        self.name = "untitled"
    }
}

extension DrawingModel {
    func overlayImage(image: UIImage) {
        let imageView = DraggableImageView(image: image)
        imageView.isUserInteractionEnabled = true
        imageView.isMultipleTouchEnabled = true
        self.canvas.addSubview(imageView)
        print(self.canvas.subviews.count)
    }
    
    // Method to create a snapshot view for sharing
    func createExportableView() -> UIView {
        // Render the canvas and its subviews into an image
        let renderer = UIGraphicsImageRenderer(bounds: canvas.bounds)
        let snapshotImage = renderer.image { context in
            canvas.layer.render(in: context.cgContext)
        }
        
        // Create an image view with the snapshot
        let imageView = UIImageView(image: snapshotImage)
        imageView.frame = canvas.bounds
        return imageView
    }
}

class DrawingViewModel: ObservableObject {
    @Published var drawing = DrawingModel()
}
