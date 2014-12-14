import QtQuick 2.0
import Material 0.1
MainView {
	anchors.fill: parent

	Image {
		anchors.fill: parent
		source: "wallpaper.png"
	}
  
 	Card {
	  	anchors.centerIn: parent
	  	width: units.dp(500)
	  	

	  	Column {
	  		id: rootColumn
	  		anchors.fill: parent
	  		spacing: units.dp(1)

	  		Label {
	  			text: "Hi!"
	  			style: "display3"
	  			anchors.horizontalCenter: parent.horizontalCenter
	  		}

	  		InputField {
	  			id: userField
	  			width: parent.width
	  			placeholderText: "username"
	  			anchors.horizontalCenter: parent.horizontalCenter
	  		}

	  		InputField {
	  			id: passwordField
	  			width: parent.width
	  			anchors.horizontalCenter: parent.horizontalCenter
	  			placeholderText: "password"
	  			echoMode: TextInput.Password
	  		}

	  		Button {
	  			anchors.horizontalCenter: parent.horizontalCenter
	  			text: "Login"
	  			onClicked: sddm.login(userField.text, passwordField.text, 0)
	  		}
	  	}
	}
}

