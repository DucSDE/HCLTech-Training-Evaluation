import QtQuick 2.0

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
        onClicked: console.log("item: "+ listView.currentIndex +" clicked")
    }
}
