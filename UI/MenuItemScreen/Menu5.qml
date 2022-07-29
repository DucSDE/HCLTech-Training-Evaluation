import QtQuick 2.0
import QtQuick.Controls 2.15
import Bosch.Prenium 1.0

Item {

    Item {
        visible: popup.visible ? false : true
        anchors.fill: parent

        BackButton {
            id: backButton
            anchors.left: parent.left
        }

        Item {
            id: screen
            width: parent.width - backButton.width
            height: parent.height
            visible: popup.visible ? false : true
            anchors {
                left: backButton.right
                top: parent.top
                right: parent.right
                bottom: parent.bottom
            }

            Text {

                anchors {
                    centerIn: screen
                }

                text:  textControl.Menu5
                font.pixelSize: 100
                color: "white"
            }
        }
    }
    PopupDialog {
        id: popup
        visible: (screenController.favRowCount() > 0) ? false : true;
        onVisibleChanged: screen.visible = !popup.visible
        anchors.fill: parent
        width: parent.width
        height: parent.height
        message: textControl.favPopupText
    }
}

