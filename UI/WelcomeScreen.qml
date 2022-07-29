import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

Item {
    id: rootWelcome
    width: parent.width
    height: parent.height
    focus: true

    Rectangle {
        id: mainScreen
        anchors.centerIn: rootWelcome
        width: parent.width
        height: parent.height
        color: "transparent"

        Image {
            id: mainImage
            anchors.centerIn: mainScreen
            source: imageSource.MainBackground

            Item {
                anchors.centerIn: parent

                Text {
                    id: mainScreenText
                    text: textControl.WelcomeTitle
                    font.pixelSize: 20
                    color: "white"
                    anchors.centerIn: parent

                }
                Text {
                    id: subMainScreenText
                    text: textControl.WelcomeSubTitle
                    font.pixelSize: 18
                    color: "white"
                    anchors.top: mainScreenText.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                }

            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    openMenuScreen()
                }
            }

        }
    }

    function openMenuScreen() {
        stackView.push("qrc:/UI/MenuScreen.qml")
    }

    Keys.onPressed:
        (p) => {
            if(p.key === Qt.Key_F1) {
                if(StackView.depth === 1){
                    openMenuScreen()
                }
                event.accepted = true;
            }
        }

}
