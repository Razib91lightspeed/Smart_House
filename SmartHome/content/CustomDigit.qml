import QtQuick 2.0

Rectangle {
    property int digit: 0
    property int previousDigit: 0

    width: 80
    height: 50
    color: "#555555"
    border.color: "#CCCCCC"
    border.width: 1
    radius: 5

    Text {
        id: digitText
        color: "white"
        font.pixelSize: 20
        anchors.centerIn: parent
        text: digit < 10 ? "0" + digit : digit

        NumberAnimation {
            id: animation
            target: digitText
            property: "text"
            from: previousDigit < 10 ? "0" + previousDigit : previousDigit
            to: digit < 10 ? "0" + digit : digit
            duration: 1000
            easing.type: Easing.InOutQuad
        }

        onTextChanged: {
            if (animation.running) {
                animation.complete()
                animation.running = false
            }
            animation.running = true
        }
    }
}
