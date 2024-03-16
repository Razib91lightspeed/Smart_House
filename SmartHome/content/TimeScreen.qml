import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: timeScreenItem
    width: 360
    height: 640

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0; color: "#1e4264" }
            GradientStop { position: 1; color: "#e6e7e8" }
        }

        Text {
            text: "My time"
            font.pixelSize: 30
            x: 130
            y: 30
        }

        // Loader to load the Clock.qml
        Loader {
            id: clockLoader
            source: "Clock.qml"
            width: 200 // Adjust the width as per your preference
            height: 200 // Adjust the height as per your preference
            x: 80
            y: 100
        }
        // Digital Clock
        Rectangle {
            id: digitalClockContainer
            width: 0
            height: 0
            radius: 0
            anchors.horizontalCenter: parent.horizontalCenter
            y: clockLoader.y + clockLoader.height + 20 // Adjust the position as needed

            Column {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 20

                Row {
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 10

                    Rectangle {
                        id: hourRect
                        width: 80
                        height: 50
                        color: "#555555"
                        border.color: "#CCCCCC"
                        border.width: 1
                        radius: 5

                        Text {
                            id: hourText
                            color: "white"
                            font.pixelSize: 20
                            anchors.centerIn: parent
                        }

                        NumberAnimation on rotation {
                            running: true
                            from: hourRect.rotation === 0 ? 360 : hourRect.rotation
                            to: hourRect.rotation === 0 ? 0 : 360
                            duration: 500
                            easing.type: Easing.InOutQuad
                        }
                    }

                    Rectangle {
                        id: minuteRect
                        width: 80
                        height: 50
                        color: "#555555"
                        border.color: "#CCCCCC"
                        border.width: 1
                        radius: 5

                        Text {
                            id: minuteText
                            color: "white"
                            font.pixelSize: 20
                            anchors.centerIn: parent
                        }

                        NumberAnimation on rotation {
                            running: true
                            from: minuteRect.rotation === 0 ? 360 : minuteRect.rotation
                            to: minuteRect.rotation === 0 ? 0 : 360
                            duration: 500
                            easing.type: Easing.InOutQuad
                        }
                    }

                    Rectangle {
                        id: secondRect
                        width: 80
                        height: 50
                        color: "#555555"
                        border.color: "#CCCCCC"
                        border.width: 1
                        radius: 5

                        Text {
                            id: secondText
                            color: "white"
                            font.pixelSize: 20
                            anchors.centerIn: parent
                        }

                        NumberAnimation on rotation {
                            running: true
                            from: secondRect.rotation === 0 ? 360 : secondRect.rotation
                            to: secondRect.rotation === 0 ? 0 : 360
                            duration: 500
                            easing.type: Easing.InOutQuad
                        }
                    }
                }

                Row {
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 10

                    Rectangle {
                        width: 100
                        height: 50
                        color: "#555555"
                        border.color: "#CCCCCC"
                        border.width: 1
                        radius: 5

                        Text {
                            id: dayText
                            color: "white"
                            font.pixelSize: 20
                            anchors.centerIn: parent
                        }

                        NumberAnimation on rotation {
                            running: true
                            from: dayText.rotation === 0 ? 360 : dayText.rotation
                            to: dayText.rotation === 0 ? 0 : 360
                            duration: 500
                            easing.type: Easing.InOutQuad
                        }
                    }

                    Rectangle {
                        width: 100
                        height: 50
                        color: "#555555"
                        border.color: "#CCCCCC"
                        border.width: 1
                        radius: 5

                        Text {
                            id: monthText
                            color: "white"
                            font.pixelSize: 20
                            anchors.centerIn: parent
                        }

                        NumberAnimation on rotation {
                            running: true
                            from: monthText.rotation === 0 ? 360 : monthText.rotation
                            to: monthText.rotation === 0 ? 0 : 360
                            duration: 500
                            easing.type: Easing.InOutQuad
                        }
                    }

                    Rectangle {
                        width: 100
                        height: 50
                        color: "#555555"
                        border.color: "#CCCCCC"
                        border.width: 1
                        radius: 5

                        Text {
                            id: yearText
                            color: "white"
                            font.pixelSize: 20
                            anchors.centerIn: parent
                        }

                        NumberAnimation on rotation {
                            running: true
                            from: yearText.rotation === 0 ? 360 : yearText.rotation
                            to: yearText.rotation === 0 ? 0 : 360
                            duration: 500
                            easing.type: Easing.InOutQuad
                        }
                    }
                }
            }
        }

        // Update digital clock every second
        Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: {
                var currentTime = new Date();
                var hours = currentTime.getHours();
                var minutes = currentTime.getMinutes();
                var seconds = currentTime.getSeconds();
                var day = currentTime.getDate();
                var month = currentTime.getMonth() + 1; // Month starts from 0, so add 1
                var year = currentTime.getFullYear();

                hourText.text = hours < 10 ? "0" + hours : hours;
                minuteText.text = minutes < 10 ? "0" + minutes : minutes;
                secondText.text = seconds < 10 ? "0" + seconds : seconds;
                dayText.text = day < 10 ? "0" + day : day;
                monthText.text = month < 10 ? "0" + month : month;
                yearText.text = year;
            }
        }

        MouseArea {
            anchors.fill: timeImage
            onClicked: stackView.pop()
        }

        Image {
            id: timeImage
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
