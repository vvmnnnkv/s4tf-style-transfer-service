import Foundation
import TensorFlow

/// Convert tensors to/from image data.
extension Base64Binary {

    func decodeFromJpeg() -> Tensor<UInt8>? {
        let imgData = TensorFlow.Raw.decodeBase64(StringTensor(b64.base64Safe()))
        return TensorFlow.Raw.decodeJpeg(contents: imgData, channels: 3, dctMethod: "")
    }

    mutating func encodeToPng(_ img: Tensor<UInt8>) {
        let png = TensorFlow.Raw.encodePng(image: img)
        let base64 = TensorFlow.Raw.encodeBase64(png)
        // Workaround for https://bugs.swift.org/browse/TF-561.
        let tmpFile = URL(fileURLWithPath: "/tmp/" + String().randomString(length: 5));
        TensorFlow.Raw.writeFile(filename: StringTensor(tmpFile.path), contents: base64)
        b64 = (try? String(contentsOf: tmpFile, encoding: .ascii).base64Unsafe()) ?? ""
        try? FileManager.default.removeItem(at: tmpFile)
    }
}
