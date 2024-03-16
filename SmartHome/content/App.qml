// app.qml

import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 360
    height: 640
    title: "Smart Home"

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: mainScreen


        Component {
            id: mainScreen

            Item {
                Rectangle {
                    anchors.fill: parent
                    gradient: Gradient {
                        GradientStop { position: 0; color: "#1e4264" }
                        GradientStop { position: 1; color: "#e6e7e8" }
                    }

                    Rectangle {
                        id: myHomeRect
                        width: 180
                        height: 40
                        color: "#1e4264"
                        border.color: "#2a5b82"
                        radius: 10
                        anchors.horizontalCenter: parent.horizontalCenter
                        y: 20
                        z: 1
                        Text {
                            id: myHome
                            text: "My Home"
                            font.pixelSize: 24
                            color: "#ffffff"
                            anchors.centerIn: parent
                            z: 1
                        }
                        SequentialAnimation {
                            loops: Animation.Infinite
                            running: true
                            PauseAnimation { duration: 10000 }
                            NumberAnimation { target: myHomeRect; property: "rotation"; from: 0; to: 360; duration: 1000 }
                        }
                    }

                    // ... Other components and loaders ...

                    Component {
                        id: iconTemplate

                        Item {
                            property string imageSource: ""
                            property string iconType: ""

                            width: 180
                            height: 180

                            Column {
                                anchors.fill: parent

                                Rectangle {
                                    width: 120
                                    height: 120
                                    color: "#1e4264"
                                    radius: 10
                                    anchors.horizontalCenter: parent.horizontalCenter

                                    Image {
                                        width: 80
                                        height: 80
                                        anchors.centerIn: parent
                                        source: imageSource
                                        smooth: true
                                    }

                                    Text {
                                        text: "My " + iconType
                                        font.pixelSize: 16
                                        color: "#ffffff"
                                        anchors.bottom: parent.bottom
                                        anchors.bottomMargin: 10
                                        anchors.horizontalCenter: parent.horizontalCenter
                                    }
                                }

                                MouseArea {
                                                    anchors.fill: parent
                                                    onClicked: {
                                                        console.log(iconType + " icon clicked")
                                                        if (iconType === "car") {
                                                            stackView.push(carScreen)
                                                        } else if (iconType === "heater") {
                                                            stackView.push(heaterScreen)
                                                        } else if (iconType === "music") {
                                                            stackView.push(musicScreen)
                                                        } else if (iconType === "light") {
                                                            stackView.push(lightScreen);
                                                        } else if (iconType === "weather") {
                                                            stackView.push(weatherScreen);
                                                        }  else if (iconType === "time") {
                                                            stackView.push(timeScreen);
                                                        } else if (iconType !== "home") {
                                                            var newWindow = Qt.createQmlObject('import QtQuick 2.15; import QtQuick.Window 2.15; Window { width: 300; height: 200; visible: true; title: "My " + iconType + " Window"; Rectangle { color: "lightblue"; anchors.fill: parent; Text { text: "This is the " + iconType + " window"; anchors.centerIn: parent } } }', stackView, "NewWindow");
                                                        }
                                    }
                                }
                            }
                        }
                    }

                    Loader {
                        x: 30
                        y: 120
                        height: 160
                        width: 160
                        sourceComponent: iconTemplate
                        onLoaded: {
                            item.imageSource = "images/car.png"
                            item.iconType = "car"
                        }
                    }

                    Loader {
                        x: 190
                        y: 120
                        height: 160
                        width: 160
                        sourceComponent: iconTemplate
                        onLoaded: {
                            item.imageSource = "images/LightOff.png"
                            item.iconType = "light"
                        }
                    }

                    Loader {
                        x: 30
                        y: 300
                        height: 160
                        width: 160
                        sourceComponent: iconTemplate
                        onLoaded: {
                            item.imageSource = "images/HeaterOff.png"
                            item.iconType = "heater"
                        }
                    }

                    Loader {
                        x: 190
                        y: 300
                        height: 160
                        width: 160
                        sourceComponent: iconTemplate
                        onLoaded: {
                            item.imageSource = "images/music.png"
                            item.iconType = "music"
                        }
                    }

                    Loader {
                        x: 60
                        y: 480
                        height: 100
                        width: 100
                        sourceComponent: iconTemplate
                        onLoaded: {
                            item.imageSource = "images/weather.png"
                            item.iconType = "weather"
                        }
                    }
                    Loader {
                        x: 220
                        y: 480
                        height: 100
                        width: 100
                        sourceComponent: iconTemplate
                        onLoaded: {
                            item.imageSource = "images/time.png"
                            item.iconType = "time"
                        }
                    }
                }
            }
        }

        Component {
            id: carScreen

            CarScreen {}
        }

        Component {
            id: lightScreen

            LightScreen {}
        }


        Component {
            id: heaterScreen

            HeaterScreen {}
        }

        Component {
            id: musicScreen

            MusicScreen {}
        }
        Component {
            id: weatherScreen

            WeatherScreen {}
        }
        Component {
            id: timeScreen

            TimeScreen {}
        }
    }
}
