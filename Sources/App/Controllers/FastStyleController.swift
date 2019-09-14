import Foundation
import Vapor
import TensorFlow
import FastStyleTransfer

final class FastStyleController {

    var model = TransformerNet()

    init() {
        try! importWeights(&model, from: "Data/candy")
    }

    func predict(_ req: Request) throws -> Future<PredictResponse<StyleTransferOutput>> {
        try req.content.decode(PredictRequest<StyleTransferInput>.self).map { predictRequest in
            let input = predictRequest.instances[0].toTensor() as Tensor<Float>
            let output = self.model(input.expandingShape(at: 0))
            let response = PredictResponse(predictions: [StyleTransferOutput(data: output.squeezingShape(at: 0))])
            return response
        }
    }

}
