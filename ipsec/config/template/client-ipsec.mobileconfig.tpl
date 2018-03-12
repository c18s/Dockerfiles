<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>PayloadContent</key>
	<array>
		<dict>
			<key>IPSec</key>
			<dict>
				<key>AuthenticationMethod</key>
				<string>SharedSecret</string>
				<key>LocalIdentifierType</key>
				<string>KeyID</string>
				<key>RemoteAddress</key>
				<string>{{ SERVER }}</string>
				<key>SharedSecret</key>
				<data>{{ PSK_B64 }}</data>
				<key>XAuthEnabled</key>
				<integer>1</integer>
				<key>XAuthName</key>
				<string>{{ USERNAME }}</string>
				<key>XAuthPassword</key>
				<string>{{ PASSWORD }}</string>
			</dict>
			<key>IPv4</key>
			<dict>
				<key>OverridePrimary</key>
				<integer>0</integer>
			</dict>
			<key>PayloadDescription</key>
			<string>Configures VPN settings</string>
			<key>PayloadDisplayName</key>
			<string>VPN</string>
			<key>PayloadIdentifier</key>
			<string>com.apple.vpn.managed.96194823-AD9E-4F8D-BF2B-B956628912C1</string>
			<key>PayloadType</key>
			<string>com.apple.vpn.managed</string>
			<key>PayloadUUID</key>
			<string>96194823-AD9E-4F8D-BF2B-B956628912C1</string>
			<key>PayloadVersion</key>
			<integer>1</integer>
			<key>Proxies</key>
			<dict>
				<key>HTTPEnable</key>
				<integer>0</integer>
				<key>HTTPSEnable</key>
				<integer>0</integer>
			</dict>
			<key>UserDefinedName</key>
			<string>IPsec-{{ SERVER }}</string>
			<key>VPNType</key>
			<string>IPSec</string>
		</dict>
	</array>
	<key>PayloadDisplayName</key>
	<string>IPsec-{{ SERVER }}</string>
	<key>PayloadIdentifier</key>
	<string>Ignored</string>
	<key>PayloadRemovalDisallowed</key>
	<false/>
	<key>PayloadType</key>
	<string>Configuration</string>
	<key>PayloadUUID</key>
	<string>Ignored</string>
	<key>PayloadVersion</key>
	<integer>1</integer>
</dict>
</plist>
