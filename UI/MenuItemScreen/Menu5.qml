import QtQuick 2.0
import QtQuick.Controls 2.15
import Bosch.Prenium.Controller 1.0

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

                text:  "Favourites Screen"
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
        message: qsTr("You can save your preferred oven settings as favourites by selecting the favourites symbol in the types of heating or dishes. Alternatively, you can also create favourites in the Home Connect app and save these on the appliance.")
    }
}

