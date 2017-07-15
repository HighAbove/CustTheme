//
//  CategoryCell.swift
//  CustomTheme
//
//  Created by Semeon D on 7/15/17.
//  Copyright © 2017 Semeon D. All rights reserved.
//
import UIKit


class CategoryCell : UICollectionViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource,
UICollectionViewDelegate{
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
    private let cellId = "Cell"

    let homesCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame:.zero,collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    func setupViews(){
        backgroundColor  = UIColor.clear
        
        addSubview(homesCollectionView)
        homesCollectionView.dataSource = self
        homesCollectionView.delegate = self
        
        homesCollectionView.register(HomeCell.self, forCellWithReuseIdentifier: cellId)

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":homesCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":homesCollectionView]))
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 14, 0, 14)
    }
}

class HomeCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named:"HomeThumbnail")
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let categoryLabel:UILabel = {
       let label = UILabel()
        label.text = "Single Bedroom"
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 2
        label.textColor = UIColor.black
        return label
    }()
    
    let locationLabel: UILabel = {
       let label = UILabel()
        label.text = "1234 Any Street Dr, City, State"
        label.font = UIFont.systemFont(ofSize: 8)
        label.textColor = UIColor.gray
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$599"
        return label
    }()
    
    func setupViews(){
        addSubview(imageView)
        addSubview(categoryLabel)
        addSubview(locationLabel)
        addSubview(priceLabel)

        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
        categoryLabel.frame = CGRect(x: 0, y: frame.width + 2, width: frame.width, height: 40)
        locationLabel.frame = CGRect(x: 0, y: frame.width + 30, width: frame.width, height: 20)
        priceLabel.frame = CGRect(x: 0, y: frame.width + 46, width: frame.width, height: 20)
    }
}
