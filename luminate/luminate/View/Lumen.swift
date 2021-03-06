//
//  Lumen.swift
//  luminate
//
//  Created by Prayash Thapa on 10/7/17.
//  Copyright © 2017 com.reality.af. All rights reserved.
//

import SceneKit

class Lumen: SCNNode {
    
    init(id: String, position: SCNVector3, size: CGFloat) {
        super.init()
        
        let orb = SCNPlane(width: size, height: size)
        let billboard = SCNBillboardConstraint()
        billboard.freeAxes = SCNBillboardAxis.all
        
        let node = SCNNode(geometry: orb)
        node.constraints = [billboard]
        node.name = id
        node.opacity = 0.0
        node.scale = SCNVector3Make(0.5, 0.5, 0.5)
        node.position = position
        
        var sprite: UIImage?
        if let textureImage = UIImage(named: "sprite1") {
            UIGraphicsBeginImageContext(textureImage.size)
            let width = textureImage.size.width
            let height = textureImage.size.height
            textureImage.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
            sprite = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }
        
        orb.firstMaterial?.diffuse.contents = sprite
        
        let displacement: Float = 0.5
        let down = SCNAction.moveBy(x: 0.0, y: CGFloat(-displacement), z: 0.0, duration: 5.0)
        let fade = SCNAction.fadeIn(duration: 3.0)
        let actions = SCNAction.group([down, fade])
        
        node.runAction(actions)
        addChildNode(node)
    }
    
    func moveUpAndDisappear() {
        let moveUp = SCNAction.moveBy(x: 0.0, y: 5.0, z: 0.0, duration: 5.0)
        let fade = SCNAction.fadeOut(duration: 3.0)
        let actions = SCNAction.group([moveUp, fade])
        
        self.runAction(actions)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
