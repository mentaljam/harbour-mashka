import QtQuick 2.0
import Sailfish.Silica 1.0


CoverBackground {

    CoverPlaceholder {
        icon.source: "/usr/share/icons/hicolor/86x86/apps/harbour-mashka.png"
        text: {
            if (mmodel.busy) {
                //% "Working..."
                qsTrId("mashka-working")
            } else if (mmodel.unusedAppsCount > 0) {
                //% "%1 could be deleted"
                qsTrId("mashka-cover-could-be-deleted").arg(Format.formatFileSize(
                    mmodel.unusedConfigSize + mmodel.unusedCacheSize + mmodel.unusedLocaldataSize))
            } else {
                qsTrId("mashka-rescan")
            }
        }
    }

    CoverActionList {
        id: coverAction

        CoverAction {
            iconSource: "image://theme/icon-s-sync"
            onTriggered: mmodel.reset()
        }
    }
}

