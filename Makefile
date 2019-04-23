TARGET = Undecimus

.PHONY: all clean

all: clean
	xcodebuild clean build CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO PRODUCT_BUNDLE_IDENTIFIER="us.diatr.undecimus" -sdk iphoneos -configuration Debug -UseModernBuildSystem=NO
	ln -sf build/Debug-iphoneos Payload
	# strip Payload/$(TARGET).app/$(TARGET)
	zip -r9 $(TARGET).ipa Payload/$(TARGET).app

clean:
	rm -rf build Payload $(TARGET).ipa
