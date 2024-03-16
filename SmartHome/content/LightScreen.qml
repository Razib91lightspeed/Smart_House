import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: lightScreenItem
    width: 360
    height: 640

    // Store the button state
    property bool lightOn: false

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0; color: "#1e4264" }
            GradientStop { position: 1; color: "#e6e7e8" }
        }

        Text {
            text: "Manage your lights"
            font.pixelSize: 30
            anchors.horizontalCenter: parent.horizontalCenter

            y: 30
        }

        // Light image
        Image {
            id: lightImage
            source: lightOn ? "/LightOn.png" : "/LightOff.png"
            width: 250
            height: 250
            x:10
            y: 250

        }

        Rectangle {
            id: buttonRect
            width: 80
            height: 50
            color: lightOn ? "#FF5252" : "#4CAF50"
            radius: 10
            border.color: "#555"
            border.width: 2
            x:240
            y: 350

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    lightOn = !lightOn;
                }
            }

            Text {
                text: lightOn ? "Off" : "On"
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
        visible: lightOn // Show only when light is on

        anchors.fill: flashImage

        Image {
            id: iconID
            source: "/images/flash.png" // Change to your image path
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
