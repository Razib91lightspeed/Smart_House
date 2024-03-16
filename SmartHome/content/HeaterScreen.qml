import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: heaterScreenItem
    width: 360
    height: 640

    // Store the button state
    property bool heaterOn: false

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0; color: "#1e4264" }
            GradientStop { position: 1; color: "#e6e7e8" }
        }

        Text {
            text: "Heat Up"
            font.pixelSize: 30
            x: 130
            y: 30
        }

        Image {
            id: heaterImage
            source: heaterOn ? "/HeaterOn.png" : "/HeaterOff.png"
            width: 250
            height: 300
            x: 10
            y: 250
        }

        Rectangle {
            id: buttonRect
            width: 80
            height: 50
            color: heaterOn ? "#FF5252" : "#4CAF50"
            radius: 10
            border.color: "#555"
            border.width: 2
            x: 270
            y: 400

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    heaterOn = !heaterOn;
                }
            }

            Text {
                text: heaterOn ? "Off" : "On"
                color: "white"
                font.pixelSize: 16
                anchors.centerIn: parent
            }
        }

        MouseArea {
            anchors.fill: homeImage
            onClicked: stackView.pop()
        }

        Image {
            id: homeImage
            source: "images/home.png"
            width: 100
            height: 100
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            y: parent.height - 120
            fillMode: Image.PreserveAspectFit
        }
    }

    // Blinking animation
    Item {
        id: blinkingItem
        visible: heaterOn // Show only when heater is on

        anchors.fill: heaterImage

        Image {
            id: iconID
            source: "images/flash.png" // Change to your image path
            fillMode: Image.PreserveAspectFit
            width: 100
            height: 480
            x: 100
            y: -70

            state: blinkingItem.visible ? "blinking" : ""

            states: [
                State {
                    name: "blinking"
                    when: blinkingItem.visible
                    PropertyChanges {
                        target: iconID
                        visible: true
                    }
                }
            ]

            transitions: [
                Transition {
                    from: "" // Default state
                    to: "blinking"

                    SequentialAnimation {
                        loops: Animation.Infinite
                        PropertyAnimation { target: iconID; property: "opacity"; from: 1.0; to: 0.0; duration: 500 }
                        PropertyAnimation { target: iconID; property: "opacity"; from: 0.0; to: 1.0; duration: 500 }
                    }
                }
            ]
        }
    }
}
