//
//  MapMarkerDetailViewController.swift
//  DO2
//
//  Created by wyn on 2023/3/18.
//

import UIKit

final class MapMarkerDetailViewController: UIViewController {
    convenience init(_ marker: MapMarker) {
        self.init()
        initImageView(marker)
        initButton()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
    }

    // MARK: Private functions
    private func initImageView(_ marker: MapMarker) {
        let imageView = UIImageView(frame: .init(x: 0, y: 0, width: view.frame.width, height: 50))
        let model = marker.model
        imageView.image = UIImage(named: model.image)
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
    }

    private func initButton() {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapJoinHandler), for: .touchUpInside)
        view.addSubview(button)
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        button.tintColor = .white
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.setTitle("Join the group", for: .normal)
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = 5
    }

    @objc func tapJoinHandler() {
        print("Ohohohoh")
    }
}
