//
//  AnyRouter.swift
//  LifeSum
//
//  Created by Mohsen on 7/9/22.
//

import Foundation
import UIKit

typealias EntryPoint = AnyView & UIViewController
protocol AnyRouter: class {
    var view: EntryPoint? { get set }
    static func start(_ view: EntryPoint) -> AnyRouter
}
