//
//  MapMarkerViewModel.swift
//  DO2
//
//  Created by wyn on 2023/3/17.
//

import GoogleMaps

final class MapMarker: GMSMarker {
    struct Model {
        let title: String
        let subtitle: String
        let image: String
    }

    let model: Model
    init(model: Model) {
        self.model = model
        super.init()
    }
}
