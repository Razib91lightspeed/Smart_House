import QtQuick 2.9

Item {
    id: root

    property int size: 200 // Increased size for better visibility
    property int lineWidth: 10 // Thicker line for the progress circle
    property real value: 56 // Example starting value

    property color primaryColor: "#29b6f6"
    property color secondaryColor: "#e0e0e0"

    property int animationDuration: 1000

    width: size
    height: size

    onValueChanged: {
        // Convert the value to degrees for the circle drawing
        canvas.degree = value * 360 / 100;
    }

    Canvas {
        id: canvas

        property real degree: 0

        anchors.fill: parent
        antialiasing: true

        onDegreeChanged: {
            requestPaint();
        }

        onPaint: {
            var ctx = getContext("2d");

            var x = width / 2;
            var y = height / 2;
            var radius = size / 2 - lineWidth;
            var startAngle = -Math.PI / 2; // Start from top (270 degrees)
            var endAngle = startAngle + Math.PI * 2; // Full circle
            var progressAngle = startAngle + degree * Math.PI / 180; // Progress based on degree

            ctx.reset();

            ctx.lineCap = 'round';
            ctx.lineWidth = lineWidth;

            // Draw background circle
            ctx.beginPath();
            ctx.arc(x, y, radius, startAngle, endAngle, false);
            ctx.strokeStyle = secondaryColor;
            ctx.stroke();

            // Draw progress arc
            ctx.beginPath();
            ctx.arc(x, y, radius, startAngle, progressAngle, false);
            ctx.strokeStyle = primaryColor;
            ctx.stroke();
        }

        Behavior on degree {
            NumberAnimation {
                duration: root.animationDuration
            }
        }
    }



    // Description text below the percentage

}
