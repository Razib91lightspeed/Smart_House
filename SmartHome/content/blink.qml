import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 360
    height: 640
    title: "Music Animation"

    Rectangle {
        id: background
        anchors.fill: parent
        color: "#1e4264" // Background color

        Repeater {
            id: barRepeater
            model: 175 // Number of bars
            delegate: Rectangle {
                id: bar
                width: 20
                height: Math.random() * background.height / 4 // Random height
                color: "white"
                anchors.verticalCenter: parent.verticalCenter
                x: (index * 60) + 10 // Spacing between bars
                y: background.height / 2 // Position vertically in the middle
            }
        }

        Timer {
            interval: 15 // Adjust interval based on desired speed
            repeat: true
            running: true
            onTriggered: {
                for (var i = 0; i < barRepeater.count; ++i) {
                    var bar = barRepeater.itemAt(i);
                    bar.x += 2; // Adjust speed by changing this value
                    if (bar.x > background.width) {
                        bar.x = -bar.width; // Wrap around to the left edge
                    }
                }
            }
        }
    }
}
