import QtQuick 2.15
import QtQuick.Controls 2.15
import Bosch.Prenium 1.0
import "CustomComponent"

Rectangle {
    id: statusBar
    color : "black"
    height: 50
    width: parent.width
    z: 100
    property alias menuPopupVisible: menuPopup.visible

    function setTitleForStatusBar(){
        if(screenController.title === "")
            return ""
        else
        {
            return TitleProvider.setTitle(screenController.title)
        }
    }

    Text {
        id: titleScreen
        text: setTitleForStatusBar()
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
            source: imageSource.Lock
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
            source: imageSource.NoWifi
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
            source: imageSource.Options
            anchors {
                right: parent.right
                rightMargin: 10
                verticalCenter: parent.verticalCenter
            }
            smooth: true
            MouseArea {
                anchors.fill: parent
                onClicked: menuPopupVisible ? menuPopupVisible = false : menuPopupVisible = true
            }
        }

    }
    MenuPopup {
        id: menuPopup
        visible: menuPopupVisible
        anchors {
            top: statusBar.bottom
            topMargin: 10
            right: statusBar.right
            rightMargin: 10
        }
    }
}
