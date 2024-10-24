//
//  CanvasView.swift
//  MDB-Project
//
//  Created by Brayton Lordianto and Amol Budhiraja on 9/30/24.
//

import SwiftUI
import PencilKit

struct CanvasView: View {
    @Binding var drawing: DrawingModel
    @State var imageToOverlay: UIImage? = nil
    @State var takingPhoto: Bool = false
    @State private var isShowingShareSheet = false
    @State private var imageToShare: UIImage? = nil

    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Spacer()
                // Add buttons for camera, eraser, and export here
                Spacer()
            }

            DrawSpace(drawing: $drawing)
                .edgesIgnoringSafeArea(.top)
        }
        .sheet(isPresented: $takingPhoto) {
            // Display ImagePicker when the camera is tapped
        }
        .onChange(of: imageToOverlay) { oldValue, newValue in
            // Implement logic to overlay selected image onto the canvas
        }
        .sheet(isPresented: $isShowingShareSheet) {
            // Present the share sheet with the generated image
        }
    }
}

// ShareSheet Struct to Present UIActivityViewController
struct ShareSheet: UIViewControllerRepresentable {
    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: applicationActivities
        )
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

// Preview Provider
#Preview {
    CanvasView(drawing: .constant(DrawingModel.init()))
}
