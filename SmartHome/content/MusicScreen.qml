import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: musicScreenItem
    width: 360
    height: 640

    // Store the button state
    property bool musicPlaying: false

    Rectangle {
        id: musicScreen
        anchors.fill: parent
        color: "#1e4264"

        Text {
            text: "Play Music"
            font.pixelSize: 30
            anchors.horizontalCenter: parent.horizontalCenter
            y: 30
        }

        Image {
            source: "/music.png"
            width: 250
            height: 250
            x: -30
            y: 300
        }

        Rectangle {
            id: buttonRect
            width: 80
            height: 50
            color: musicPlaying ? "#FF5252" : "#4CAF50"
            radius: 10
            border.color: "#555"
            border.width: 2
            x: 230
            y: 400

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    musicPlaying = !musicPlaying;
                    animationTimer.running = musicPlaying; // Start or stop the animation timer based on the musicPlaying state
                }
            }

            Text {
                text: musicPlaying ? "Stop" : "Play"
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

    // Animation for music visualization
    Rectangle {
        id: animation
        width: musicScreen.width
        height: 450 // Adjust as needed
        anchors.top: musicScreen.top
        color: "transparent"

        Repeater {
            id: barRepeater
            model: 5 // Number of bars
            delegate: Rectangle {
                width: 20
                height: Math.random() * animation.height / 2 // Random height
                color: "white"
                anchors.verticalCenter: parent.verticalCenter
                x: (index * 80) + 10 // Spacing between bars
                y: animation.height / 4 // Position vertically in the middle
            }
        }

        Timer {
            interval: 15 // Adjust interval based on desired speed
            repeat: true
            running: false // Initially not running
            id: animationTimer
            onTriggered: {
                for (var i = 0; i < barRepeater.count; ++i) {
                    var bar = barRepeater.itemAt(i);
                    bar.x += 2; // Adjust speed by changing this value
                    if (bar.x > animation.width) {
                        bar.x = -bar.width; // Wrap around to the left edge
                    }
                }
            }
        }

        states: [
            State {
                name: "running"
                when: animationTimer.running
                PropertyChanges { target: animationTimer; running: true }
            }
        ]
    }
}
