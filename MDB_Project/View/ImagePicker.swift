//
//  ImagePicker.swift
//  MDB-Project
//
//  Created by Brayton Lordianto on 9/30/24.
//

import Foundation
import PhotosUI
import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            // Dismiss the picker and handle the selected image
        }
    }

    func makeUIViewController(context: Context) -> PHPickerViewController {
        // Configure the PHPicker to select images only
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) { }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
