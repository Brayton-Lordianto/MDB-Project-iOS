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
            
            VStack(alignment: .center) {
                Text("PicDraw 🖌️")
                    .bold()
                    .font(.title)
                
                CanvasView(drawing: $drawingViewModel.drawing)
        }
    }
}

#Preview {
    ContentView()
}
