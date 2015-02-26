import QtQuick 2.0
import Material 0.1
import Material.Extras 0.1
import Material.Desktop 0.1

MainView {
	anchors.fill: parent

	Repeater {
		model: screenModel

		Image {
			x: geometry.x; y: geometry.y; width: geometry.width; height:geometry.height
			source: "wallpaper.png"
		}
	}

	property int selectedUser: -1

	Item {
		id: primaryScreen

		property var geometry: screenModel.geometry(screenModel.primary)
		x: geometry.x; y: geometry.y; width: geometry.width; height: geometry.height

		IndicatorRow {}

		Row {
			anchors.centerIn: parent

			spacing: units.dp(16)

			Repeater {
				id: users
				model: userModel

				delegate: View {
					elevation: 2
					radius: units.dp(2)

					width: selectedUser == index ? units.dp(250) : units.dp(200)
					height: selectedUser == index ? units.dp(260) : units.dp(210)

					Behavior on width {
						NumberAnimation { duration: 250 }
					}

					Behavior on height {
						NumberAnimation { duration: 250 }
					}

					Ink {
						anchors.fill: parent

						z: -1

						onClicked: {
							if (selectedUser == index) {
								selectedUser = -1
							} else {
								selectedUser = index
							}
						}
					}

					Column {
						id: column
						width: parent.width

						anchors {
							left: parent.left
							right: parent.right
							top: parent.top
							margins: units.dp(32)
						}

						CircleImage {
							id: image

							anchors.horizontalCenter: parent.horizontalCenter

							visible: status == Image.Ready
							width: units.dp(100)
							height: width/sourceSize.width * sourceSize.height
							source: homeDir + "/.face"

							Rectangle {
								anchors.fill: parent
								color: "transparent"
								border.color: Qt.rgba(0,0,0,0.3)
								radius: width/2
							}
						}

						Rectangle {
							anchors.horizontalCenter: parent.horizontalCenter
							visible: image.status != Image.Ready
							width: image.width
							height: width
							border.color: Qt.darker(color, 1.2)
							color: Qt.rgba(0.8,0.8,0.8, 1)
							radius: width/2

							Icon {
								anchors.centerIn: parent
								size: parent.width * 2/3
								color: "white"
								name: "social/person"
							}
						}

						Item {
							width: parent.width
							height: units.dp(24)
						}

						Label {
							id: label
							text: realName
							height: visible ? implicitHeight + units.dp(8) : units.dp(32)
							verticalAlignment: Text.AlignVCenter
							//visible: index != selectedUser
							anchors.horizontalCenter: parent.horizontalCenter
							style: "title"
						}

						Item {
							anchors.horizontalCenter: parent.horizontalCenter
							width: units.dp(250) - parent.anchors.margins * 2
							height: visible ? field.height : 0

							visible: opacity > 0
							opacity: index == selectedUser ? 1 : 0

							Behavior on height {
								NumberAnimation { duration: 200 }
							}

							Behavior on opacity {
								NumberAnimation { duration: 200 }
							}

							onVisibleChanged: {
								if (!visible)
									field.text = ""
							}

							TextField {
								id: field
								width: parent.width
								placeholderText: "Password"
								input.echoMode: TextInput.Password

								onAccepted: {
									sddm.login(name, text, sessionModel.lastIndex)
								}
							}
						}
					}
				}
			}
		}
	}

	UPower {
		id: upower
	}

	Sound {
		id: sound

		property string iconName: sound.muted ? "av/volume_off"
		: sound.master <= 33 ? "av/volume_mute"
		: sound.master >= 67 ? "av/volume_up"
		: "av/volume_down"
	}

	property var now: new Date()

	Timer {
		interval: 1000
		repeat: true
		running: true
		onTriggered: now = new Date()
	}
}
