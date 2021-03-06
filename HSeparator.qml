import QtQuick 2.0
import QtQuick.Layouts 1.1


Item{
    id: container
    property alias handleY: handle.y
    property alias itemT: loaderT.sourceComponent
    property alias itemB: loaderB.sourceComponent
    property alias handle: handle
    property color backgroundColor: "#fff"
    property color handleColor: "#888888"

    Item{
        id: topItem
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        Layout.fillWidth: true
        x: 0
        y: 0
        height: container.height - (container.height-Math.round(handle.y+handle.height))
        Rectangle{
            anchors.fill: parent
            color: backgroundColor
            clip: true
            Loader { id: loaderT
                anchors.fill: parent
            }
        }

    }
    Rectangle{
        id: handle
        color: handleColor
        height: 4
        z: 1
        y: Math.round(container.height/2 - height/2)
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        Layout.fillWidth: true

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.SizeVerCursor
            drag.target: parent
            drag.axis: Drag.YAxis
            drag.minimumY: Math.round(container.height*0.1)
            drag.maximumY: (container.height*0.9 - parent.height)
        }
    }
    Item{
        id: buttomItem
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        Layout.fillWidth: true
        x: 0
        y: container.height-height
        height: container.height - Math.round(handle.y+handle.height)
        Rectangle{
            anchors.fill: parent
            color: backgroundColor
            Layout.fillWidth: true
            Loader { id: loaderB
                anchors.fill: parent
            }
        }
    }
}
