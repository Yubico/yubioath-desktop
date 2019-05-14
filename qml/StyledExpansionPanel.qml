import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0

ColumnLayout {

    id: expansionPanel

    property string label
    property string description
    property bool isEnabled: true
    property bool isExpanded: !isEnabled ? true : false

    property string toolButtonIcon
    property string toolButtonToolTip
    property alias toolButton: toolButton

    spacing: 16

    RowLayout {
        Layout.rightMargin: -12

        ColumnLayout {
            Label {
                text: label
                font.pixelSize: 13
                font.bold: false
                color: formText
                Layout.fillWidth: true
            }
            Label {
                Layout.alignment: Qt.AlignRight | Qt.AlignTop
                Layout.fillWidth: true
                font.pixelSize: 11
                color: formLabel
                text: description
                wrapMode: Text.WordWrap
                Layout.rowSpan: 1
            }
        }

        ToolButton {
            id: expandButton
            onClicked: {
                if (isExpanded) {
                    //                    settingsPanel.contentHeight = settingsPanel.contentHeight
                    //                            - expansionPanel.height
                    isExpanded = false
                } else {
                    isExpanded = true
                    //                    settingsPanel.contentHeight = settingsPanel.contentHeight
                    //                            + expansionPanel.height
                }
            }
            icon.width: 24
            icon.source: isExpanded ? "../images/up.svg" : "../images/down.svg"
            icon.color: isDark() ? yubicoWhite : yubicoGrey
            visible: isEnabled
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                enabled: false
            }
            ToolTip {
                text: isExpanded ? "Show less" : "Show more"
                delay: 1000
                parent: expandButton
                visible: parent.hovered
                Material.foreground: app.isDark(
                                         ) ? defaultDarkForeground : defaultLight
                Material.background: app.isDark(
                                         ) ? defaultDarkOverlay : defaultLightForeground
            }
        }

        ToolButton {
            id: toolButton
            icon.width: 24
            icon.source: toolButtonIcon
            icon.color: isDark() ? yubicoWhite : yubicoGrey
            visible: !isEnabled && !!toolButtonIcon
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                enabled: false
            }
            ToolTip {
                text: toolButtonToolTip
                delay: 1000
                parent: toolButton
                visible: parent.hovered
                Material.foreground: app.isDark(
                                         ) ? defaultDarkForeground : defaultLight
                Material.background: app.isDark(
                                         ) ? defaultDarkOverlay : defaultLightForeground
            }
        }
    }
}