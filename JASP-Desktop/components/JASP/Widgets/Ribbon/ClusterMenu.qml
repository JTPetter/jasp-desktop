//
// Copyright (C) 2013-2018 University of Amsterdam
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public
// License along with this program.  If not, see
// <http://www.gnu.org/licenses/>.
//

import QtQuick 2.11
import QtQuick.Controls 2.4
import JASP.Theme 1.0


Menu {
    property alias model: menuRepeater.model

    width: {
        /*
         * Automatically set the width of menu
         */
        var result = 0;
        for (var i = 0; i < count; ++i) {
            result = Math.max(itemAt(i).item.implicitWidth, result);
        }

        return result;
    }

    Repeater {
        id      : menuRepeater

        delegate: Loader {
            sourceComponent: displayText === "???" ? menuSeparator : analysisDelegate

            Component {
                id: analysisDelegate

                MenuItem {
                    id: menuItem
                    text        : displayText
                    height      : Theme.menuItemHeight
                    hoverEnabled: true

                    contentItem: Text {
                        text             : menuItem.text
                        font             : menuItem.font
                        opacity          : enabled ? 1.0 : 0.3
                        verticalAlignment: Text.AlignVCenter
                        elide            : Text.ElideRight
                    }

                    background: Rectangle {
                        opacity: enabled ? 1 : 0.3
                        color  : menuItem.hovered ? "#acafac" : "#ffffff"
                    }
                }
            }

            Component {
                id: menuSeparator
                MenuSeparator {
                    contentItem: Rectangle {
                        implicitWidth: 200
                        implicitHeight: 1
                        color: "#1E000000"
                    }

                    background: Rectangle {
                        border.width: 0
                    }
                }
            }
        }
    }
}
