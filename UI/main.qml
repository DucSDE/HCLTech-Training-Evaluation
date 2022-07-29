import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import Bosch.Prenium 1.0

ApplicationWindow {
    id: root
    width: 1024
    height: 680
    visible: true
    title: qsTr("Bosch Prenium")
    color: "black"

    ScreenController {
        id: screenController
    }

    StatusBar {
        id: statusBar
        anchors {
            top:  parent.top
        }
    }

    StackView {
        id: stackView
        visible: true
        anchors {
            left: root.left
            right: root.right
            top: statusBar.bottom
            bottom: root.bottom
        }
        height: root.height - statusBar.height
        width: root.width
        initialItem: "qrc:/UI/WelcomeScreen.qml"
    }

    Item {
        anchors.fill: parent
        focus: true
        Keys.onPressed:
            (event) => {
                if(event.key === Qt.Key_F1)
                {
                    var d = stackView.depth;
                    if ( d > 1){
                        stackView.pop(null)
                        screenController.setTitle("")
                        event.accepted = true;
                    }
                    else if ( d === 1){
                        stackView.push("qrc:/UI/MenuScreen.qml")
                    }
                }
            }
    }
}
