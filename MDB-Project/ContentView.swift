//
//  ContentView.swift
//  MDB-Project
//
//  Created by Brayton Lordianto on 9/30/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var drawingViewModel = DrawingViewModel()
    var body: some View {
        NavigationStack {
            NavigationLink("Go to Drawing") {
                CanvasView(drawing: $drawingViewModel.drawing)
            }
        }
    }
}

#Preview {
    ContentView()
}
