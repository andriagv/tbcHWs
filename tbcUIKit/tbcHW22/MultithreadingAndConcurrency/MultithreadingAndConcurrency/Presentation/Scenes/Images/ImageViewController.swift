//
//  ImageViewController.swift
//  MultithreadingAndConcurrency
//
//  Created by Nika Topuria on 06.11.24.
//

import UIKit

final class ImageViewController: UIViewController {
    private let viewModel = ImageViewModel()
    private let fetchButton = UIButton(type: .system)
    private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }

    private func setupUI() {
        view.backgroundColor = .white
        setupFetchButton()
        setupCollectionView()
        setupConstraints()
    }

    private func setupFetchButton() {
        fetchButton.setTitle("Fetch Images", for: .normal)
        fetchButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        fetchButton.setTitleColor(.systemBlue, for: .normal)
        fetchButton.addTarget(self, action: #selector(fetchImagesButtonTapped), for: .touchUpInside)
        fetchButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fetchButton)
    }

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        let itemSpacing: CGFloat = 10
        let itemsPerRow: CGFloat = 2
        let totalSpacing = (itemsPerRow - 1) * itemSpacing
        let itemWidth = (view.bounds.width - totalSpacing - 20) / itemsPerRow
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        layout.minimumLineSpacing = itemSpacing
        layout.minimumInteritemSpacing = itemSpacing

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.identifier)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            fetchButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            fetchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fetchButton.heightAnchor.constraint(equalToConstant: 44),

            collectionView.topAnchor.constraint(equalTo: fetchButton.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }

    private func setupBindings() {
        viewModel.onImagesUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }

    @objc private func fetchImagesButtonTapped() {
        viewModel.updateNumberOfImages(to: 10)
        // გასატესტად uncomment გაუკეთეთ ქვემოთ მოცემულ მეთოდებს საჭიროებისამებრ
        
//         viewModel.fetchImagesWithGCD()
//         viewModel.fetchImagesWithOperationQueue()
//         viewModel.fetchImagesWithAsyncAwait()
    }
}

extension ImageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as? ImageCell else {
            return UICollectionViewCell()
        }
        let image = viewModel.images[indexPath.item]
        cell.configure(with: image)
        return cell
    }
}
