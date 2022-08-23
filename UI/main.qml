import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import Bosch.Prenium 1.0

Window {
    id: root
    width: 1080
    height: 680
    minimumWidth: 720
    minimumHeight: 680
    visible: true
    title: AppName
    color: "black"

    ScreenController {
        id: screenController
    }

    StatusBar {
        id: statusBar
        anchors {
            top:  parent.top
        }
        menuPopupVisible: false
    }

    StackView {
        id: stackView
        visible: true
        z: 0
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

/*##^##
Designer {
    D{i:0;formeditorZoom:0.33;height:680;width:1024}
}
##^##*/
