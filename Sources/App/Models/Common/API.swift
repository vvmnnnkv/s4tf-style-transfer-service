import Foundation
import Vapor
import TensorFlow

protocol ModelInput {
    func toTensor<T: TensorFlowScalar & Numeric>() -> Tensor<T>
}

protocol ModelOutput {
    init<T: TensorFlowScalar & Numeric>(data: Tensor<T>)
}

struct PredictRequest<T: ModelInput & Codable> {
    var instances: [T]
}

struct PredictResponse<T: ModelOutput & Codable> {
    var predictions: [T]
}

/// Allows to be encoded to and decoded from HTTP messages.
extension PredictRequest: Content { }
extension PredictResponse: Content { }

protocol Base64Binary: Codable {
    var b64: String { get set }
}

