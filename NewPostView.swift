//
//  NewPostView.swift
//  CommYOUnity Volunteering
//
//  Created by Adedeji Jare Kuforiji on 4/5/24.
//

import Foundation
import UIKit

class NewPostView: UIView
{
    public var Title: String?
    public var Body: String?
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setup()
    }
    
   
    required init?(coder: NSCoder){
        super.init(coder: coder)
        setup()
    }
    
    override func draw(_: CGRect){
        let path = UIBezierPath()
        path.move(to: CGPoint(x:0,y:50))
        path.addLine(to: CGPoint(x:400,y:50))
        path.lineWidth = 2.0
        UIColor.lightGray.setStroke()
        path.close()
        path.stroke()
        
    }
    
    private func setup(){
        self.backgroundColor = UIColor.white
        //Profile Picture
        
        
        //Title
        let PostTitle = UITextField(frame: CGRect(x:0, y:0,width:150,height:20))
        PostTitle.placeholder = "Title"
        PostTitle.adjustsFontSizeToFitWidth = true
        PostTitle.font = UIFont(name: "SF Pro", size: 35)
        PostTitle.textColor = UIColor.black
        Title = PostTitle.text
        self.addSubview(PostTitle)
        
        
        //Post Divider
        draw(self.frame)
        
        
        //Body
        let PostBody = UITextField(frame: CGRect(x:0, y:60,width:400,height:600))
        PostBody.placeholder = "New Post"
        PostBody.adjustsFontSizeToFitWidth = true
        PostBody.textColor = UIColor.black
        Body = PostBody.text
        self.addSubview(PostBody)
        
        
    }
}
