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

        PathView {
            id: pathView
            width: contentFrame.width
            height: 400
            anchors.verticalCenter: contentFrame.verticalCenter

            model: menuModel
            delegate: menuListDelegate
            pathItemCount: 3
            path: Path {

                startX: 0
                startY: pathView.height/2

                PathLine {
                    id: path1
                    x: -150
                    y: pathView.height/2

                }
                PathLine {
                    id: path2
                    x: pathView.width/2
                    y: pathView.height/2

                }
                PathLine {
                    id: path3
                    x: pathView.width *2 - 150
                    y: pathView.height/2

                }

            }
            SequentialAnimation{
                id:listViewAnimation
                loops:Animation.Infinite
            }
            onCurrentIndexChanged: {
                listViewAnimation.restart()
            }
            focus: true
            Component.onCompleted: {
                positionViewAtIndex(pathView.count - 1, PathView.Beginning)
            }
        }
    }

    Component {
        id: menuListDelegate

        Item {
            width: 850
            height: 250

            Image {
                id: itemImage
                width: 250
                height: 250
                source: imageURL
                anchors {
                    left: parent.left
                    leftMargin: 50
                    verticalCenter: parent.verticalCenter
                }
            }

            Rectangle {
                id: itemText
                width: pathView.currentIndex ? 600 : 0
                height: parent.height
                color: "transparent"

                anchors {
                    left: itemImage.right
                    leftMargin: 50
                    right: parent.right
                    rightMargin: 20
                    verticalCenter: itemImage.verticalCenter
                }

                Text {
                    id: itemTitle
                    width: itemText.width - 150
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
            bottom: menuScreen.bottom
            horizontalCenter: menuScreen.horizontalCenter
        }
        color: "transparent"

        PageIndicator {
            id: indicator
            currentIndex: {
                if(pathView.currentIndex === (pathView.count - 1) )
                    return (pathView.currentIndex - 6)
                 else
                    return (pathView.currentIndex + 1)
            }

            count: pathView.count

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

                radius: width/2

                required property int index
                color: index === indicator.currentIndex ? "#eb7734" : "gray"
                opacity: index === indicator.currentIndex ? 0.95 : 0.45
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


/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.33;height:680;width:1080}
}
##^##*/
