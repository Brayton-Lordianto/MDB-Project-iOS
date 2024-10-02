//
//  DrawingViewModel.swift
//  MDB-Project
//
//  Created by Brayton Lordianto on 9/30/24.
//

import Foundation
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
        self.name = "untitiled"
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
}

// MARK: if you want to add more drawings you can edit these and stuff
class DrawingViewModel: ObservableObject {
    @Published var drawing = DrawingModel()
}
