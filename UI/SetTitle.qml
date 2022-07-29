pragma Singleton
import QtQuick 2.0

Item {
    property string title: "Default title"
    function setTitle(newTitle){
        title = newTitle;
        return title;
    }
}
