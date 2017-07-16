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
    //MARK: properties
    private let cellId = "Cell"
    
    var homeCategory :HomeCategory?{
        didSet{
            if let name = homeCategory?.name {
                categoryLabel.text = name
                
                }
            }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
    

    let homesCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame:.zero,collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let categoryLabel:UILabel = {
        let label = UILabel()
        label.text = "Homes"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupViews(){
        backgroundColor  = UIColor.clear
        
        addSubview(homesCollectionView)
        addSubview(categoryLabel)
        
        homesCollectionView.dataSource = self
        homesCollectionView.delegate = self
        
        homesCollectionView.register(HomeCell.self, forCellWithReuseIdentifier: cellId)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":categoryLabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":homesCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[nameLabel(30)][v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":homesCollectionView,"nameLabel":categoryLabel]))
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return 5
        if let count = homeCategory?.homes?.count {
            return count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeCell
        cell.home = homeCategory?.homes?[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: frame.height - 31)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 14, 0, 14)
    }
}

class HomeCell: UICollectionViewCell {
    var home :Home?{
        didSet{
            typeLabel.text = home?.type
            locationLabel.text = home?.location
            if let price = home?.price{
                priceLabel.text = "$\(price)"
            }
        }
    }

    
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
    
    let typeLabel:UILabel = {
       let label = UILabel()
        label.text = "Single Bedroom"
        label.font = UIFont.systemFont(ofSize: 12)
        //label.numberOfLines = 2
        label.textColor = UIColor.black
        return label
    }()
    
    
    let locationLabel: UILabel = {
       let label = UILabel()
        label.text = "1234 Any Street Dr, City, State"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = UIColor.gray
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$599"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    func setupViews(){
        addSubview(imageView)
        addSubview(typeLabel)
        addSubview(locationLabel)
        addSubview(priceLabel)

        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
        typeLabel.frame = CGRect(x: 0, y: frame.width + 2, width: frame.width, height: 40)
        locationLabel.frame = CGRect(x: 0, y: frame.width + 30, width: frame.width, height: 20)
        priceLabel.frame = CGRect(x: 0, y: frame.width + 46, width: frame.width, height: 20)
    }
}
