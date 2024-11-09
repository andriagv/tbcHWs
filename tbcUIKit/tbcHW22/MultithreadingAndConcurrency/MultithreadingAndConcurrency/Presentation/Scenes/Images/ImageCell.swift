//
//  ImageCell.swift
//  MultithreadingAndConcurrency
//
//  Created by Nika Topuria on 06.11.24.
//

import UIKit

final class ImageCell: UICollectionViewCell {
    static let identifier = "ImageCell"

    private let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
        setupConstraints()
        styleCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupImageView() {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    private func styleCell() {
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
    }

    func configure(with image: UIImage) {
        imageView.image = image
    }
}
