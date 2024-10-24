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
        // Define properties for an image, its position (center), scale, and rotation
    }

    init() {
        self.canvas = .init()
        self.name = "untitled"
    }
}

extension DrawingModel {
    func overlayImage(image: UIImage) {
        // Implement adding an image as a subview to the canvas
    }
    
    func createExportableView() -> UIView {
        // Implement logic to capture the canvas and create a snapshot image
    }
}

class DrawingViewModel: ObservableObject {
    @Published var drawing = DrawingModel()
}
