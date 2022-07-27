import QtQuick 2.0
import Bosch.Prenium.Controller 1.0

Rectangle {
    id: statusBar
    color : "black"
    //    color:"transparent"
    height: 50
    width: parent.width

    Text {
        id: titleScreen
        text: screenController.title
        font.pixelSize: 38
        width: 100
        color: "lightGray"
        anchors {
            left: statusBar.left
            leftMargin: 20
            verticalCenter: statusBar.verticalCenter
        }
    }

    Rectangle {
        id: rightSide
        color:"transparent"
        height: statusBar.height
        width: statusBar - titleScreen.width
        anchors {
            verticalCenter: statusBar.verticalCenter
            right: statusBar.right
        }


        Image {
            id: lockScreenStatus
            height: 25
            width: 25
            source: "qrc:/UI/assets/lock_white.png"
            anchors {
                right: wifiSignal.left
                rightMargin: 10
                verticalCenter: parent.verticalCenter
            }
            smooth: true
        }


        Image {
            id: wifiSignal
            height: 25
            width: 25
            source: "qrc:/UI/assets/no_wifi_white.png"
            anchors {
                right: seperator.left
                rightMargin: 10
                verticalCenter: parent.verticalCenter
            }
            smooth: true
        }


        Rectangle {
            anchors {
                right:  menuOptions.left
                rightMargin: 10
                verticalCenter: parent.verticalCenter
            }
            id: seperator
            width: 2
            height: parent.height-10
            radius: 10
            color: "darkGray"
            smooth: true
        }

        Image {
            id: menuOptions
            height: 25
            width: 25
            source: "qrc:/UI/assets/options.png"
            anchors {
                right: parent.right
                rightMargin: 10
                verticalCenter: parent.verticalCenter
            }
            smooth: true
        }

    }
}
