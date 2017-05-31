//
//  Cell.swift
//  ZLayout
//
//  Created by Igor Zarubin on 31/05/2017.
//  Copyright © 2017 Igor Zarubin. All rights reserved.
//

import UIKit
import ZLayout

class Cell: UICollectionViewCell {
    
    class func size(collectionView: UICollectionView) -> CGSize {
        let ratio: CGFloat = 5/7
        let imageHeight: CGFloat = collectionView.width * ratio
        let height: CGFloat = 120 + imageHeight + 100
        return CGSize(width: collectionView.width, height: height)
    }
    
    private lazy var avatarImageView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 2, y: 2, width: 36, height: 36))
        view.layer.cornerRadius = view.width / 2
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.image = #imageLiteral(resourceName: "catAvatar")
        return view
    }()
    
    private lazy var contentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "spiderCat")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var favoritesImageVIew: UIImageView = {
       let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Favorites")
        return imageView
    }()
    
    private lazy var commentImageVIew: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Comment")
        return imageView
    }()
    
    private lazy var likeImageVIew: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Like")
        return imageView
    }()
    
    private lazy var moreOptions: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "MoreOptions")
        return imageView
    }()
    
    private lazy var avatarContainerView: UIView = {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        view.layer.cornerRadius = view.width / 2
        view.clipsToBounds = true
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.borderWidth = 2
        return view
    }()
    
    private lazy var headerView: UIView = UIView()
    private lazy var actionsView: UIView = UIView()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "jasonreevesrichardson"
        return label
    }()
    
    private lazy var viewsCountLabel: UILabel = {
        let label = UILabel()
        label.text = "666 views"
        return label
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Omg omg omg!!\nThis spider eats my cat 😱😱😱"
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialSetup()
    }
    
    private func initialSetup() {
        self.contentView.addSubview(headerView)
        self.headerView.addSubview(avatarContainerView)
        self.avatarContainerView.addSubview(avatarImageView)
        self.headerView.addSubview(moreOptions)
        self.headerView.addSubview(nameLabel)
        self.contentView.addSubview(contentImageView)
        self.contentView.addSubview(actionsView)
        self.actionsView.addSubview(likeImageVIew)
        self.actionsView.addSubview(commentImageVIew)
        self.actionsView.addSubview(favoritesImageVIew)
        self.contentView.addSubview(viewsCountLabel)
        self.contentView.addSubview(textLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.headerView.anchorToParent(edge: .top, gravity: .center, width: .superView, height: 60)
        self.avatarContainerView.anchorToParent(edge: .leftOffset(16), gravity: .center)
        self.moreOptions.anchorToParent(edge: .rightOffset(16), gravity: .center, width: .auto, height: .auto)
        self.nameLabel.alignAndFill(on: .rightOffset(16),
                                    relativeTo: avatarContainerView,
                                    withGravity: .center,
                                    stretchTo: moreOptions,
                                    trailingPadding: 16,
                                    size: .auto)
        let ratio: CGFloat = 5/7
        self.contentImageView.align(on: .bottom,
                                    relativeTo: headerView,
                                    withGravity: .center,
                                    width: .superView,
                                    height: .value(self.width * ratio))
        self.actionsView.align(on: .bottom,
                               relativeTo: contentImageView,
                               withGravity: .center,
                               width: .superView,
                               height: 60)
        self.likeImageVIew.anchorToParent(edge: .leftOffset(16),
                                          gravity: .center,
                                          width: .auto,
                                          height: .auto)
        self.favoritesImageVIew.anchorToParent(edge: .rightOffset(16),
                                          gravity: .center,
                                          width: .auto,
                                          height: .auto)
        self.commentImageVIew.align(on: .rightOffset(16),
                                 relativeTo: likeImageVIew,
                                 withGravity: .center,
                                 width: .auto,
                                 height: .auto)
        self.viewsCountLabel.align(on: .bottom, relativeTo: actionsView, withGravity: .leftOffset(20), width: .auto, height: .auto)
        self.textLabel.align(on: .bottomOffset(6), relativeTo: viewsCountLabel, withGravity: .left, width: .auto, height: .auto)
    }
}
