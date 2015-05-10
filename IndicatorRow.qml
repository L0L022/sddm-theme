/*
* Papyros SDDM theme - The SDDM theme for Papyros following Material Design
* Copyright (C) 2015 Michael Spencer <sonrisesoftware@gmail.com>
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program. If not, see <http://www.gnu.org/licenses/>.
*/
import QtQuick 2.0
import QtQuick.Controls 1.2 as Controls
import QtQuick.Controls.Styles.Material 0.1 as MaterialStyle
import Material 0.1

View {
    id: indicators

    anchors {
        right: parent.right
        bottom: parent.bottom
        margins: Units.dp(20)
    }

    width: row.width + Units.dp(24)
    height: row.height + Units.dp(24)

    radius: Units.dp(2)
    elevation: 2

    Row {
        id: row

        anchors.centerIn: parent

        spacing: Units.dp(16)

        Label {
            text: Qt.formatTime(now)
            font.pixelSize: Units.dp(16)
            anchors.verticalCenter: parent.verticalCenter
        }

        Icon {
            name: sound.iconName
            size: Units.dp(20)
        }

        Icon {
            name: upower.deviceIcon(upower.primaryDevice)
            size: Units.dp(20)
        }

        IconButton {
            iconName: "awesome/desktop"
            size: Units.dp(20)
            color: "gray"
            onClicked: sessionDialog.show()
        }

        Dialog {
            id: sessionDialog
            title: qsTr("Select session" )

            property int index: 0

            Controls.ExclusiveGroup {
                id: sessionGroup
            }

            Repeater {
                id: sessionRepeater
                model: sessionModel

                Controls.RadioButton {
                    text: name
                    checked: index === sessionDialog.index
                    exclusiveGroup: sessionGroup
                    onClicked: sessionDialog.index = index
                    style: MaterialStyle.RadioButtonStyle {}
                }
            }

            onOpened: {
                index = selectedSession
                sessionGroup.current.checked = false
                sessionRepeater.itemAt(selectedSession).checked = true
            }
            onAccepted: selectedSession = index
        }

        IconButton {
            iconName: "hardware/keyboard"
            size: Units.dp(20)
            color: "gray"
            onClicked: layoutDialog.show()
        }

        Dialog {
            id: layoutDialog
            title: qsTr("Select layout")

            property int index: 0

            Controls.ExclusiveGroup {
                id: layoutGroup
            }

            Repeater {
                id: layoutRepeater
                model: keyboard.layouts

                Controls.RadioButton {
                    text: modelData.longName
                    checked: index === layoutDialog.index
                    exclusiveGroup: layoutGroup
                    onClicked: layoutDialog.index = index
                    style: MaterialStyle.RadioButtonStyle {}
                }
            }

            onOpened: {
                index = keyboard.currentLayout
                layoutGroup.current.checked = false
                layoutRepeater.itemAt(keyboard.currentLayout).checked = true
            }
            onAccepted: keyboard.currentLayout = index
        }

        IconButton {
            iconName: "awesome/power_off"
            size: Units.dp(20)
            color: "gray"
            visible: sddm.canPowerOff
            onClicked: sddm.powerOff()
        }

        IconButton {
            iconName: "navigation/refresh"
            size: Units.dp(20)
            color: "gray"
            visible: sddm.canReboot
            onClicked: sddm.reboot()
        }
    }
}
