import QtQuick 2.0
import Bosch.Prenium 1.0
Item {
    id: popupDialog
    property string message: ""
    Rectangle {
        id: dialog
        color: "transparent"
        anchors.centerIn: parent
        width: popupDialog.width - 100
        height: popupDialog.height - 100

        Image {
            source: imageSource.CloseButton
            width: 50
            height: 50
            anchors {
                top: dialog.top
                right: dialog.right
            }

            MouseArea{
                anchors.fill: parent
                onClicked:{
                    popupDialog.visible = false;
                }
            }
        }
        Text {
            text: message
            color: "white"
            width: parent.width - 100
            anchors.centerIn: dialog
            font.pixelSize: 30
            wrapMode: Text.WordWrap
        }
    }
}
