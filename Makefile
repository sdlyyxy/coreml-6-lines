MNISTClassifier.mlmodel:
	wget https://ml-assets.apple.com/coreml/models/Image/DrawingClassification/MNISTClassifier/MNISTClassifier.mlmodel
MNISTClassifier.mlmodelc: MNISTClassifier.mlmodel
	xcrun coremlc compile MNISTClassifier.mlmodel .

MNISTClassifier.swift: MNISTClassifier.mlmodel
	xcrun coremlc generate MNISTClassifier.mlmodel . --language Swift

main: MNISTClassifier.mlmodelc MNISTClassifier.swift main.swift
	swiftc main.swift MNISTClassifier.swift

clean:
	rm -rf MNISTClassifier.swift MNISTClassifier* main
