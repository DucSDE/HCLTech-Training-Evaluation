import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    id: backButton
    width: 60
    height: parent.height
    anchors {
        left: parent.left
    }
    Image {
        width: 50
        height: 50
        anchors {
            centerIn: parent
        }
        source: "qrc:/UI/assets/back.png"
    }
    MouseArea {
        anchors.fill: parent
        onClicked:{
            stackView.pop()
            screenController.setTitle("")
        }
    }

}
