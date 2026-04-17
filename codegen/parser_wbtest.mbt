///|
test "parse_proto_image reads file and package fields" {
  let json =
    #|{
    #|  "file": [
    #|    {
    #|      "name": "google/firestore/v1/firestore.proto",
    #|      "package": "google.firestore.v1",
    #|      "messageType": [
    #|        {
    #|          "name": "Document",
    #|          "field": [
    #|            { "name": "name", "jsonName": "name", "type": "TYPE_STRING" }
    #|          ]
    #|        }
    #|      ],
    #|      "service": [
    #|        {
    #|          "name": "Firestore",
    #|          "method": [
    #|            {
    #|              "name": "GetDocument",
    #|              "inputType": ".google.firestore.v1.GetDocumentRequest",
    #|              "outputType": ".google.firestore.v1.Document",
    #|              "options": {
    #|                "[google.api.http]": {
    #|                  "get": "/v1/{name=projects/*/databases/*/documents/*/**}"
    #|                }
    #|              }
    #|            }
    #|          ]
    #|        }
    #|      ]
    #|    }
    #|  ]
    #|}
  let image = parse_proto_image(json)
  assert_eq(image.file.length(), 1)
  let file = image.file[0]
  assert_eq(file.package_, Some("google.firestore.v1"))
  assert_eq(file.message_type.unwrap().length(), 1)
  assert_eq(file.service.unwrap().length(), 1)
}
