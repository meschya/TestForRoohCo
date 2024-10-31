import Foundation

typealias EmptyBlock = () -> Void

typealias BoolBlock = (Bool) -> Void
typealias BoolResultBlock = () -> Bool
typealias NestedBoolBlock = (@escaping BoolBlock) -> Void

typealias OptionalURLBlock = (URL?) -> Void
