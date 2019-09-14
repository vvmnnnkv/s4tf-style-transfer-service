# Fast Style Transfer Service with S4TF and Vapor 

Swift for TensorFlow [model](https://github.com/vvmnnnkv/s4tf-fast-style-transfer) wrapped in a HTTP/REST service, 
with basic front-end included.

Tested with Ubuntu and Swift for TensorFlow v0.5-rc0.
 
Live demo: https://s4tf-style-transfer.herokuapp.com

![Style Transfer with S4TF](/Docs/demo.gif?raw=true "Style Transfer with S4TF")

## REST API

API tries to be compatible with [TF Serving Predict API](https://www.tensorflow.org/tfx/serving/api_rest#predict_api).

Expected input image format is JPEG, output format is PNG (base64-encoded).

Request:
```
POST /v1/models/style-transfer:predict
{
    "instances": [{"b64": "ABC=="}]
}
```

Response:
```
200 OK
{
    "predictions": [{"b64": "ABC=="}]
}
```

## Docker
Checkout repo, build image and run: 
```
$ docker build --tag=s4tf-style-transfer .
$ docker run --rm -p 8080:80 s4tf-style-transfer
```
Open http://localhost:8080/
