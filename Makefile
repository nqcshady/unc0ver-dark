TARGET = Undecimus

.PHONY: all clean

all: clean
	xcodebuild clean build CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO PRODUCT_BUNDLE_IDENTIFIER="us.diatr.undecimus" -sdk iphoneos -configuration Release
	ln -sf build/Release-iphoneos Payload
	# strip Payload/$(TARGET).app/$(TARGET)
	# ldid -SUndecimus/multi_path.entitlements Payload/$(TARGET).app/$(TARGET)
	zip -r9 $(TARGET).ipa Payload/$(TARGET).app

clean:
	rm -rf build Payload $(TARGET).ipa
