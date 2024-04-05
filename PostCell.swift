//
//  PostCell.swift
//  CommYOUnity Volunteering
//
//  Created by Adedeji Jare Kuforiji on 4/4/24.
//

import Foundation
import UIKit

class PostCell: UICollectionViewCell
{
    let postObject = PostView(frame: CGRect(x:0,y:0,width:600,height:400))
    
   
    
     
    private func Setup()
    {
        addSubview(postObject)
        
        postObject.translatesAutoresizingMaskIntoConstraints = false
        postObject.topAnchor.constraint(equalTo: topAnchor).isActive = true
        postObject.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        postObject.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    func configure(title: String,body:String)
    {
        self.postObject.Title = title
        self.postObject.Body = body
        self.Setup()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        self.postObject.Title = nil
        self.postObject.Body = nil
    }
}
