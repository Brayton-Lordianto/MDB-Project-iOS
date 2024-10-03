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
                
                // Camera Button
                Button(action: { self.takingPhoto.toggle() }, label: {
                    Image(systemName: "camera").foregroundColor(.white).bold()
                })
                .padding()
                .background(Color.blue)
                .cornerRadius(1000)
                
                // Eraser Button
                Button(action: {
                    drawing.canvas.drawing = PKDrawing()
                    imageToOverlay = nil
                }, label: {
                    Image(systemName: "eraser").foregroundColor(.white).bold()
                })
                .padding()
                .background(Color.blue)
                .cornerRadius(1000)
                
                // Export Button
                Button(action: {
                    // Generate the image and present the share sheet
                    let exportableView = drawing.createExportableView()
                    let renderer = UIGraphicsImageRenderer(size: exportableView.bounds.size)
                    let image = renderer.image { ctx in
                        exportableView.drawHierarchy(in: exportableView.bounds, afterScreenUpdates: true)
                    }
                    self.imageToShare = image
                    self.isShowingShareSheet = true
                }, label: {
                    Image(systemName: "square.and.arrow.up").foregroundColor(.white).bold()
                })
                .padding()
                .background(Color.blue)
                .cornerRadius(1000)
                
                Spacer()
            }
            
            DrawSpace(drawing: $drawing)
                .edgesIgnoringSafeArea(.top)
        }
        .sheet(isPresented: $takingPhoto) {
            ImagePicker(image: $imageToOverlay)
        }
        .onChange(of: imageToOverlay) { oldValue, newValue in
            if let image = newValue {
                drawing.overlayImage(image: image)
            }
        }
        .sheet(isPresented: $isShowingShareSheet) {
            if let imageToShare = imageToShare {
                ShareSheet(activityItems: [imageToShare])
            } else {
                Text("No image available")
            }
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
