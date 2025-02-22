//
//  calculateP.swift
//  SSC
//
//  Created by Italo Guilherme Monte on 29/01/25.
//

import Foundation
import SwiftUI

enum CardInCanvasError: Error {
    case tooManyCards
}

enum Dimensions {
    case width
    case height
}

func calculatePercent(dimensionValue: CGFloat, dimension: Dimensions, geo: GeometryProxy) -> CGFloat {
    switch dimension {
    case .height:
        return (dimensionValue / 1620) * geo.size.height
    case .width:
        return (dimensionValue / 2160) * geo.size.width
    }
}
