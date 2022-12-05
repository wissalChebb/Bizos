//
//  SigniatureView.swift
//  Memorize
//
//  Created by Apple Esprit on 5/12/2022.
//

import Foundation
import SwiftUI
import PencilKit
struct SigniatureView: View {
    @ObservedObject var viewModel = UserViewModel()
    @State var canvas = PKCanvasView()
    @State var isDraw = true
    @State var color : Color = .black
    @State var type : PKInkingTool.InkType = .pencil
    @State var colorpicker = false
    var body: some View {
        
        
        NavigationView{
            DrowingView(canvas: $canvas, isDraw: $isDraw, type: $type,color: $color)
                .navigationTitle("Signature")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: Button(action: {
                    // save
                    saveImage()
                }, label: {
                    Image(systemName: "square.and.arrow.down.fill").font(.title).tint(Color(uiColor: UIColor(red: 0.886, green: 0.851, blue: 0.765, alpha: 1)))
                }),trailing: HStack(spacing: 15){
                    Button (action: {
                        isDraw = false
                        
                        
                    })
                    {
                        Image(systemName: "pencil.slash").font(.title).tint(Color(uiColor: UIColor(red: 0.886, green: 0.851, blue: 0.765, alpha: 1)))
                    }
                    Menu {
                        
                        Button(action: {
                            isDraw = true
                            type = .pencil
                            
                        }) {
                            Label {
                                Text("Pencil")
                            } icon: {
                                Image(systemName: "pencil")
                            }
                        }
                        Button(action: {
                            isDraw = true
                            type = .pen
                        }) {
                            Label {
                                Text("Pen")
                            } icon: {
                                Image(systemName: "pencil.tip")
                            }
                        }
                        Button(action: {
                            isDraw = true
                            type = .marker
                        }) {
                            Label {
                                Text("Marker")
                            } icon: {
                                Image(systemName: "highlighter")
                            }
                        }
                        
                    } label: {
                        Image(systemName: "menucard")
                            .font(.title)
                            .tint(Color(uiColor: UIColor(red: 0.886, green: 0.851, blue: 0.765, alpha: 1)))
                    
                    }

                    

                })
                .sheet(isPresented: $colorpicker) {
                    ColorPicker("Pick Color ", selection: $color).padding()
                }
            
        }
    }
    func pngFrom(image: UIImage) -> UIImage {
        let imageData = image.pngData()!
        let imagePng = UIImage(data: imageData)!
        return imagePng
    }
    func saveImage()
    {
        let image = canvas.drawing.image(from: canvas.drawing.bounds, scale: 1)
        let mewImage = pngFrom(image: image)
        UIImageWriteToSavedPhotosAlbum(mewImage, nil, nil, nil)
        viewModel.addSignature(user: UserViewModel.currentUser ?? User(firstname: "", password: "", email: "", lastName: "", specialite: "", image: "", experience: 0, role: ""), image: image)
    }
}

struct DrowingView : UIViewRepresentable {
    
    @Binding var canvas : PKCanvasView
    @Binding var isDraw : Bool
    @Binding var type : PKInkingTool.InkType
    @Binding var color : Color
    var ink : PKInkingTool {
        PKInkingTool(type,color: UIColor(color))
    }
    let eraser = PKEraserTool(.bitmap)
    
    func makeUIView(context: Context) -> PKCanvasView {
        
       
       
        canvas.drawingPolicy = .anyInput
        canvas.tool = isDraw ? ink : eraser
        
        return canvas;
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        
        uiView.tool = isDraw ? ink : eraser
    }
}


#if DEBUG
struct obPreviews : PreviewProvider {
    static var previews: some View {
       
        SigniatureView()
    }
}
#endif
