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
        let height: CGFloat = 120 + imageHeight + 60
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
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private lazy var viewsCountLabel: UILabel = {
        let label = UILabel()
        label.text = "666 likes"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "4 HOURS AGO"
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    private lazy var viewsAllCommentsLabel: UILabel = {
        let label = UILabel()
        label.text = "View all 13 comments"
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Omg omg omg!!\nThis spider eats my cat 😱😱😱"
        label.font = UIFont.systemFont(ofSize: 12)
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
        self.contentView.addSubview(viewsAllCommentsLabel)
        self.contentView.addSubview(dateLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let ratio: CGFloat = 5/7
        self.headerView.anchor(toParentEdge: .top, gravity: .center, width: .superView, height: 60)
        self.avatarContainerView.anchor(toParentEdge: .left, gravity: .center, offset: CGPoint(x: 16, y: 0))
        self.moreOptions.anchor(toParentEdge: .right, gravity: .center, width: .auto, height: .auto, offset: CGPoint(x: -16, y: 0))
        self.nameLabel.alignAndFill(on: .rightOffset(16), relativeTo: avatarContainerView, withGravity: .center, stretchTo: moreOptions, trailingPadding: 16, size: .auto)
        self.contentImageView.align(on: .bottom, relativeTo: headerView, withGravity: .center, width: .superView, height: .value(self.width * ratio))
        self.actionsView.align(on: .bottom, relativeTo: contentImageView, withGravity: .center, width: .superView, height: 50)
        self.likeImageVIew.anchor(toParentEdge: .left, gravity: .center, width: .auto, height: .auto, offset: CGPoint(x: 16, y: 0))
        self.favoritesImageVIew.anchor(toParentEdge: .right, gravity: .center, width: .auto, height: .auto, offset: CGPoint(x: -16, y: 0))
        self.commentImageVIew.align(on: .rightOffset(16), relativeTo: likeImageVIew, withGravity: .center, width: .auto, height: .auto)
        self.viewsCountLabel.align(on: .bottom, relativeTo: actionsView, withGravity: .leftOffset(16), width: .auto, height: .auto)
        self.textLabel.align(on: .bottomOffset(6), relativeTo: viewsCountLabel, withGravity: .left, width: .auto, height: .auto)
        self.viewsAllCommentsLabel.align(on: .bottomOffset(3), relativeTo: textLabel, withGravity: .left, width: .auto, height: .auto)
        self.dateLabel.align(on: .bottomOffset(3), relativeTo: viewsAllCommentsLabel, withGravity: .left, width: .auto, height: .auto)
    }
}
