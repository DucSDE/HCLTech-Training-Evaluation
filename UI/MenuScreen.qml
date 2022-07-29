import QtQuick 2.7
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 2.15
import Bosch.Prenium 1.0

Rectangle {
    id: menuScreen
    focus: true
    color: "transparent"

    Rectangle {
        id: contentFrame
        width: menuScreen.width
        height: menuScreen.height - footer.height

        color: "transparent"
        anchors{
            top: menuScreen.top
            bottom: footer.top
            horizontalCenter: menuScreen.horizontalCenter
        }

        ListView {
            id: listView
            width: parent.width
            height: 230
            anchors {
                centerIn: contentFrame
                horizontalCenter: contentFrame.horizontalCenter
                verticalCenter: contentFrame.verticalCenter
            }

            orientation: ListView.Horizontal
            model: menuModel
            highlightRangeMode: ListView.StrictlyEnforceRange
            delegate: menuListDelegate
            clip: true
        }

    }

    Component {
        id: menuListDelegate
        Item {
            width: listView.width
            height: 210

            Image {
                id: itemImage
                width: 200
                height: 200
                source: imageURL

                anchors {
                    left: parent.left
                    leftMargin: 50
                }
            }

            Rectangle {
                id: itemText
                height: itemImage.height
                color: "transparent"
                anchors {
                    left: itemImage.right
                    leftMargin: 20
                    right: parent.right
                    rightMargin: 20
                    verticalCenter: itemImage.verticalCenter
                }

                Text {
                    id: itemTitle
                    width: itemText.width
                    height: itemText.height/2

                    anchors {
                        top: itemText.top
                        topMargin: 20
                        left: itemText.left
                    }
                    text: menuTitle
                    color: "#ffffff"
                    wrapMode: Text.WordWrap
                    font.pixelSize: 50
                }
                Text {
                    id: itemDescription
                    width: itemText.width
                    height: itemText.height/2
                    anchors {
                        top: itemTitle.bottom
                        topMargin: 10
                        left: itemTitle.left
                        right: itemTitle.right
                        bottom: itemText.bottom
                    }
                    text: menuDes
                    color: "#ededed"
                    wrapMode: Text.WordWrap
                    font.pixelSize: 25
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    screenController.setTitle(menuTitle)
                    stackView.push(src)
                }
            }
        }
    }

    Rectangle {
        id: footer
        width: menuScreen.width
        height: 60
        anchors {
            top: contentFrame.bottom
            bottom: menuScreen.bottom
            horizontalCenter: menuScreen.horizontalCenter
        }
        color: "transparent"

        MouseArea {
            anchors.fill: parent
            onClicked: getH()
        }

        PageIndicator {
            id: indicator
            currentIndex: listView.currentIndex
            count: listView.count
            interactive: true
            anchors {
                centerIn: footer
                horizontalCenterOffset: 0
                horizontalCenter: footer.horizontalCenter
                verticalCenter: footer.verticalCenter
            }

            delegate:
                Rectangle {
                implicitWidth: 15
                implicitHeight: 15

                radius: width
                color: "#eb7734"

                opacity: index === listView.currentIndex ? 0.95 : pressed ? 0.7 : 0.45

                Behavior on opacity {
                    OpacityAnimator {
                        duration: 50
                    }
                }
            }
        }
    }

    Keys.onPressed:
        (event)=> {
            if (event.key === Qt.Key_F1) {
                event.accepted = true;
            }
        }
}
