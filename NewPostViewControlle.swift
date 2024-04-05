//
//  NewPostViewControlle.swift
//  CommYOUnity Volunteering
//
//  Created by Adedeji Jare Kuforiji on 4/5/24.
//

import Foundation
import UIKit



protocol NewPostDelegate
{
    func didSubmitPost(title: String, body: String)
}

class NewPostViewController: UIViewController
{
    var delegate: NewPostDelegate?
    public var Title: String?
    public var Body: String?
    let NPV = NewPostView(frame:CGRect(x:0,y:0,width:1179,height:2556))
    
    private var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.blue
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 7
        return button
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(NPV)
        Setup_Button()
        self.button.addTarget(self, action: #selector(testfunc), for: .touchUpInside)

    }
    
    @objc func testfunc()
    {
        delegate?.didSubmitPost(title: "At least this works", body: "Example post")
        
    }
    
    func Setup_Button()
    {
        view.addSubview(button)
        button.frame = CGRect(x:150,y:300, width:50,height:50)

    }
    
}
