import QtQuick 2.0
import Material 0.1

View {
    id: indicators

    anchors {
        right: parent.right
        bottom: parent.bottom
        margins: units.dp(20)
    }

    width: row.width + units.dp(24)
    height: row.height + units.dp(24)

    radius: units.dp(2)
    elevation: 2

    Row {
        id: row

        anchors.centerIn: parent

        spacing: units.dp(16)

        Label {
            text: Qt.formatTime(now)
            font.pixelSize: units.dp(16)
            anchors.verticalCenter: parent.verticalCenter
        }

        Icon {
            name: "av/volume_up"
            size: units.dp(20)
        }

        Icon {
            name: upower.deviceIcon(upower.primaryDevice)
            size: units.dp(20)
        }

        Icon {
            name: "awesome/power_off"
            size: units.dp(20)
            color: "gray"
        }
    }
}
