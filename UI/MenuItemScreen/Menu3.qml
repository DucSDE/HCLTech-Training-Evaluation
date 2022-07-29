import QtQuick 2.0
import QtQuick.Controls 2.15

Item {

    BackButton {
        id: backButton
        anchors.left: parent.left
    }

    Item {
        id: screen
        width: parent.width - backButton.width
        height: parent.height
        anchors {
            left: backButton.right
            top: parent.top
            right: parent.right
            bottom: parent.bottom
        }

        Text {

            anchors {
                centerIn: parent
            }

            text:  textControl.Menu3
            font.pixelSize: 100
            color: "white"
        }
    }
}
