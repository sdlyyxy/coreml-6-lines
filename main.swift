import CoreML
let model = try? MNISTClassifier(contentsOf: URL(fileURLWithPath:"MNISTClassifier.mlmodelc"))
let input=try MNISTClassifierInput(imageAt:URL(fileURLWithPath:"8.png"))
let prediction = try? model!.prediction(input:input)
let digit = prediction!.classLabel
print("Predicted digit: \(digit)")
