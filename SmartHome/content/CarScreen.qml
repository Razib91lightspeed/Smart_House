import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: carScreenItem
    width: 360
    height: 640

    // Store the button state
    property bool carCharging: false

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0; color: "#1e4264" }
            GradientStop { position: 1; color: "#e6e7e8" }
        }

        Text {
            text: "Charge Electric Car"
            font.pixelSize: 30
            x: 60
            y: 30
        }

        Image {
            source: "/images/car.png"
            width: 250
            height: 250
            x: 10
            y: 290
        }

        Rectangle {
            id: buttonRect
            width: 80
            height: 50
            color: carCharging ? "#FF5252" : "#4CAF50"
            radius: 10
            border.color: "#555"
            border.width: 2
            x: 270
            y: 400

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    carCharging = !carCharging;
                }
            }

            Text {
                text: carCharging ? "Stop" : "Start"
                color: "white"
                font.pixelSize: 16
                anchors.centerIn: parent
            }
        }

        // Integrate CircleProgressBar here
        CircleProgressBar {
            id: progressBar
            size: 200
            lineWidth: 10
            value: canvas.progress // Bind to the progress property of Canvas
            x: 80 // Adjust the position as needed
            y: 100 // Adjust the position as needed
        }

        // Include blink animation directly here
        Item {
            id: blinkingItem
            visible: carCharging // Show only when car is charging

            anchors.fill: buttonRect

            Image {
                id: iconID
                source: "images/flash.png" // Change to your image path
                fillMode: Image.PreserveAspectFit
                width: 100
                height: 160
                x: -150
                y: -280

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
}
