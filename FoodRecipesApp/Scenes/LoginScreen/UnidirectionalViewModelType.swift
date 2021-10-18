import Foundation

protocol InputType {}

protocol OutputType {}

protocol UnidirectionalViewModelType {
    associatedtype Input: InputType
    associatedtype Output: OutputType

    func configure(input: Input) -> Output
}
