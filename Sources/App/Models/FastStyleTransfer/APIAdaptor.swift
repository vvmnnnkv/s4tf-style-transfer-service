import Foundation
import TensorFlow

struct StyleTransferInput: Base64Binary {
    var b64: String
}

struct StyleTransferOutput: Base64Binary {
    var b64: String
}

extension StyleTransferInput: ModelInput {
    func toTensor<T: TensorFlowScalar & Numeric>() -> Tensor<T> {
        return Tensor<T>(decodeFromJpeg()!) / 255
    }
}

extension StyleTransferOutput: ModelOutput {
    init<T: TensorFlowScalar & Numeric>(data: Tensor<T>) {
        b64 = ""
        let clipped = TensorFlow.Raw.clipByValue(t: data, clipValueMin: Tensor(0), clipValueMax: Tensor(255))
        encodeToPng(Tensor<UInt8>(clipped))
    }
}
