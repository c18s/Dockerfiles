<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>PayloadContent</key>
	<array>
		<dict>
			<key>L2TP</key>
			<dict>
				<key>AuthenticationMethod</key>
				<string>SharedSecret</string>
				<key>LocalIdentifierType</key>
				<string>KeyID</string>
				<key>SharedSecret</key>
				<data>{{ PSK_B64 }}</data>
			</dict>
			<key>IPv4</key>
			<dict>
				<key>OverridePrimary</key>
				<integer>1</integer>
			</dict>
			<key>PPP</key>
			<dict>
				<key>AuthName</key>
				<string>{{ USERNAME }}</string>
				<key>AuthPassword</key>
				<string>{{ PASSWORD }}</string>
				<key>CommRemoteAddress</key>
				<string>{{ SERVER }}</string>
			</dict>
			<key>PayloadDescription</key>
			<string>Configures VPN settings</string>
			<key>PayloadDisplayName</key>
			<string>VPN</string>
			<key>PayloadIdentifier</key>
			<string>com.apple.vpn.managed.l2tp.{{ SERVER_MD5 }}</string>
			<key>PayloadType</key>
			<string>com.apple.vpn.managed</string>
			<key>PayloadUUID</key>
			<string>l2tp-{{ SERVER_MD5 }}</string>
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
			<string>L2TP-{{ SERVER }}</string>
			<key>VPNType</key>
			<string>L2TP</string>
		</dict>
	</array>
	<key>PayloadDisplayName</key>
	<string>L2TP-{{ SERVER }}</string>
	<key>PayloadIdentifier</key>
	<string>L2TP.{{ SERVER_MD5 }}</string>
	<key>PayloadRemovalDisallowed</key>
	<false/>
	<key>PayloadType</key>
	<string>Configuration</string>
	<key>PayloadUUID</key>
	<string>L2TP-{{ SERVER_MD5 }}</string>
	<key>PayloadVersion</key>
	<integer>1</integer>
</dict>
</plist>
