import QtQuick 2.0
import QtQuick.Controls 2.15
import "../CustomComponent"

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
            width: parent.width
            wrapMode: Text.WordWrap
            anchors {
                centerIn: parent
            }

            text:  textControl.Menu1
            font.pixelSize: 100
            color: "white"
        }
    }
}
