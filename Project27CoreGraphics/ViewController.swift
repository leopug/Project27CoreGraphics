//
//  ViewController.swift
//  Project27CoreGraphics
//
//  Created by Ana Caroline de Souza on 17/03/20.
//  Copyright © 2020 Ana e Leo Corp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var currentDrawType = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        drawTwin()
    }

    @IBAction func redrawTapped(_ sender: Any) {
        currentDrawType += 1
        
        if currentDrawType > 7 {
            currentDrawType = 0
        }
        
        switch currentDrawType {
        case 0:
            drawTwin()
        case 1:
            drawCircle()
        case 2:
            drawCheckerBoard()
        case 3:
            drawRotatedSquares()
        case 4:
            drawLines()
        case 5:
            drawImagesAndText()
        case 6:
            drawRectangle()
        case 7:
            drawEmoji()
        default:
            break
        }
        
    }
    
    func drawEmoji() {
        
            let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
            
            let image = renderer.image { ctx in

                let circle = CGRect(x: 0, y: 0, width: 512, height: 512).insetBy(dx: 5, dy: 5)
                ctx.cgContext.setFillColor(UIColor.yellow.cgColor)
                ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
                ctx.cgContext.setLineWidth(10)
                
                ctx.cgContext.addEllipse(in: circle)
                ctx.cgContext.drawPath(using: .fillStroke)
                
                let leftEye = CGRect(x: 125, y: 90, width: 80, height: 80)
                ctx.cgContext.setFillColor(UIColor.black.cgColor)
                ctx.cgContext.addEllipse(in: leftEye)
                ctx.cgContext.drawPath(using: .fillStroke)
                
                let rightEye = CGRect(x: 290, y: 90, width: 80, height: 80)
                ctx.cgContext.setFillColor(UIColor.black.cgColor)
                ctx.cgContext.addEllipse(in: rightEye)
                ctx.cgContext.drawPath(using: .fillStroke)
                                
                ctx.cgContext.move(to: CGPoint(x: 150, y: 290))
                ctx.cgContext.addQuadCurve(to: CGPoint(x: 350, y: 290), control: CGPoint(x: 250, y: 450))
                ctx.cgContext.setFillColor(UIColor.yellow.cgColor)
                ctx.cgContext.drawPath(using: .fillStroke)
                
            }
            
            imageView.image = image
            
        
    }
    
    func drawImagesAndText(){
         let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
         
         let image = renderer.image { ctx in
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let attrs: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 36),
                .paragraphStyle: paragraphStyle
            ]
            
            let string = "The best-laid schemes o'\nmice an' men gang aft agley"
            
            let attributedString = NSAttributedString(string: string, attributes: attrs)
            
            attributedString.draw(with: CGRect(x: 32, y: 32, width: 448, height: 448), options: .usesLineFragmentOrigin, context: nil)
            
            let mouse = UIImage(named: "mouse")
            mouse?.draw(at: CGPoint(x: 300, y: 150))
            
            
         }
         
         imageView.image = image
         
     }
    
    func drawLines(){
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        
        let image = renderer.image { ctx in
            
            ctx.cgContext.translateBy(x: 256, y: 256)
            
            var first = true
            var length: CGFloat = 256
            
            for _ in 0..<256 {
                ctx.cgContext.rotate(by: .pi/2)
                if first {
                    ctx.cgContext.move(to: CGPoint(x: length, y: 50))
                    first = false
                } else {
                    ctx.cgContext.addLine(to: CGPoint(x: length, y: 50))
                }
                length*=0.99
            }
            
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.strokePath()
        }
        
        imageView.image = image
        
    }
    
    func drawRotatedSquares(){
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        
        let image = renderer.image { ctx in
            
            ctx.cgContext.translateBy(x: 256, y: 256)
            let rotations = 16
            
            let amount = Double.pi / Double(rotations)
            
            for _ in 0..<rotations {
                ctx.cgContext.rotate(by: CGFloat(amount))
                ctx.cgContext.addRect(CGRect(x: -128, y: -128, width: 256, height: 256))
            }
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.strokePath()
        }
        
        imageView.image = image
        
    }
    
    func drawCheckerBoard(){
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        
        let image = renderer.image { ctx in

            ctx.cgContext.setFillColor(UIColor.black.cgColor)
            
            for row in 0..<8 {
                for column in 0..<8 {
                    if (row+column) % 2 == 0 {
                        ctx.cgContext.fill(CGRect(x: column*64, y: row*64, width: 64, height: 64))
                    }
                }
            }
            
        }
        
        imageView.image = image
        
    }
    
    func drawRectangle(){
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        
        let image = renderer.image { ctx in

            let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512)
            ctx.cgContext.setFillColor(UIColor.red.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(10)
            
            ctx.cgContext.addRect(rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
            
        }
        
        imageView.image = image
        
    }
    
    func drawCircle(){
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        
        let image = renderer.image { ctx in

            let circle = CGRect(x: 0, y: 0, width: 512, height: 512).insetBy(dx: 5, dy: 5)
            ctx.cgContext.setFillColor(UIColor.red.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(10)
            
            ctx.cgContext.addEllipse(in: circle)
            ctx.cgContext.drawPath(using: .fillStroke)
            
        }
        
        imageView.image = image
        
    }
    
    func drawTwin(){
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        
        let image = renderer.image { ctx in

            let context = ctx.cgContext
            context.setStrokeColor(UIColor.black.cgColor)
            context.setLineWidth(10)
            
            //T
            context.move(to: CGPoint(x: 0, y: 100))
            context.addLine(to: CGPoint(x: 100, y: 100))
            context.drawPath(using: .fillStroke)
            context.move(to: CGPoint(x: 50, y: 100))
            context.addLine(to: CGPoint(x: 50, y: 200))
            context.drawPath(using: .fillStroke)
            
            //W
            context.move(to: CGPoint(x: 110, y: 100))
            context.addLine(to: CGPoint(x: 140, y: 200))
            context.drawPath(using: .fillStroke)
            context.move(to: CGPoint(x: 140, y: 200))
            context.addLine(to: CGPoint(x: 180, y: 150))
            context.drawPath(using: .fillStroke)
            context.move(to: CGPoint(x: 180, y: 150))
            context.addLine(to: CGPoint(x: 220, y: 200))
            context.drawPath(using: .fillStroke)
            context.move(to: CGPoint(x: 220, y: 200))
            context.addLine(to: CGPoint(x: 260, y: 100))
            context.drawPath(using: .fillStroke)
            
            //I
            context.move(to: CGPoint(x: 270, y: 100))
            context.addLine(to: CGPoint(x: 270, y: 200))
            context.drawPath(using: .fillStroke)
            
            //N
            context.move(to: CGPoint(x: 290, y: 100))
            context.addLine(to: CGPoint(x: 290, y: 200))
            context.drawPath(using: .fillStroke)
            context.move(to: CGPoint(x: 295, y: 100))
            context.addLine(to: CGPoint(x: 330, y: 200))
            context.drawPath(using: .fillStroke)
            context.move(to: CGPoint(x: 330, y: 200))
            context.addLine(to: CGPoint(x: 330, y: 100))
            context.drawPath(using: .fillStroke)
        }
        
        imageView.image = image
        
    }
    
}

