import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id:win
    visible: true
    width: 640
    height: 480
    title: qsTr("States")

    Rectangle{
        id:myRect
        width: 100
        height: 100
        color: "black"



        MouseArea{
            id:area1
            anchors.fill:parent
            onPressed: myRect.state == "pressed" ? myRect.state = "" :
                                                   myRect.state = "pressed"

            onReleased: myRect.state == "released" ? myRect.state = "" :
                                                     myRect.state = "released"
        }


        states: [
            State {
                name: "pressed"

                PropertyChanges {
                    target: myRect2; color:"blue";height:150; width:150;rotation:45;
                }
            },
            State {
                name: "released"
                PropertyChanges {
                    target: myRect2; color:"yellow";height:100; width:100;rotation:0;

                }
            }
        ]
    }

    Rectangle{
        id:myRect2
        width: 100
        height:100
        x: 150
        y: 150
        color: "yellow"

        Behavior on width {
            NumberAnimation{duration: 1000}
        }

        Behavior on height {
            NumberAnimation{duration: 1000}
        }

        Behavior on color {
            ColorAnimation {
                duration: 1000
            }
        }

        Behavior on rotation {
            NumberAnimation{duration: 1000}

        }
    }
}
