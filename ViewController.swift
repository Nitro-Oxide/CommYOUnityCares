//
//  ViewController.swift
//  CommYOUnity Volunteering
//
//  Created by Adedeji Jare Kuforiji on 3/3/24.
//

import UIKit
import SwiftUI


struct postAssests {
    var Title: String
    var Body: String
    
}


class PostViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,NewPostDelegate

{
    
    
    var collectionView: UICollectionView!
    var posts = [postAssests]()
    
    
    private var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        button.setTitle("+", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 7
        return button
    }()
    
    override func viewDidLoad()
    {
    
        if (posts.count == 0)
        {
            Setup_Home()
        }
        
        else{
            //Collection View
            Setup_CollectionView()
        }
            Setup_Button()
            self.button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    
    func Setup_Home()
    {
        view.backgroundColor = UIColor.systemGray5
        let dpn = UILabel()
        dpn.text = "No Posts Found"
        dpn.font = UIFont(name: "SF Pro",size:25)
        dpn.frame = CGRect(x:100,y:200,width:200, height: 25)
        dpn.textAlignment = NSTextAlignment.center
        view.addSubview(dpn)
    }
    
    func Setup_Button()
    {
        view.addSubview(button)
        button.frame = CGRect(x:250,y:250, width:50,height:50)

    }
    
    func Setup_CollectionView()
    {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.systemGray6
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PostCell.self, forCellWithReuseIdentifier: "cell")
        Setup_Button()
        self.button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    func didSubmitPost(title: String, body: String) {
        let newPost = postAssests(Title:title,Body:body)
        posts.append(newPost)
        Setup_CollectionView()
        print(posts.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return posts.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PostCell
        let PostContent = self.posts[indexPath.row]
        cell.configure(title: PostContent.Title, body: PostContent.Body)
        return cell
    }
    @objc func didTapButton()
    {
        let PVC = NewPostViewController()
        PVC.delegate = self
        self.present(PVC,animated:true,completion: nil)
    }
    
}
