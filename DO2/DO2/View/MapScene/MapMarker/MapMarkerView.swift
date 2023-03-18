//
//  MapMarkerView.swift
//  DO2
//
//  Created by wyn on 2023/3/17.
//

import UIKit

final class MapMarkerView: UIView {
    convenience init(frame: CGRect, _ model: MapMarkerViewModel) {
        self.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 10
        clipsToBounds = true

        let imageView = UIImageView(frame: .init(x: 0, y: 0, width: 100, height: 100))
        imageView.image = UIImage(named: "Dog")
        addSubview(imageView)


        let label = UILabel(frame: .init(x: 105, y: 5, width: 150, height: 20))
        label.text = model.title
        addSubview(label)

        let subtitle = UILabel(frame: .init(x: 105, y: label.frame.height + label.frame.origin.y + 5, width: 150, height: 20))
        subtitle.text = model.subtitle
        subtitle.font = .systemFont(ofSize: 14, weight: .light)
        addSubview(subtitle)
    }
}
