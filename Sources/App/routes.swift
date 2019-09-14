import Vapor

public func routes(_ router: Router) throws {
    // Serve index.html by default.
    router.get("/") { req -> Future<Response> in
        let dirConfig = try req.make(DirectoryConfig.self)
        return try req.streamFile(at: dirConfig.workDir + "Public/index.html")
    }

    let fastStyleController = FastStyleController()
    router.post("/v1/models/style-transfer:predict", use: fastStyleController.predict)
}

