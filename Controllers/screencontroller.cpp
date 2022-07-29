#include "screencontroller.h"

ScreenController::ScreenController(QObject *parent)
    : QObject{parent},
      m_screenType(NONE)
{
    m_title = "";
}

ScreenController::~ScreenController()
{
    destroyed();
}

void ScreenController::setTitle(const QString &newTitle)
{
    if (m_title == newTitle)
        return;
    m_title = newTitle;
    emit titleChanged();
}

const QString &ScreenController::getTitle() const
{
    return m_title;
}

const ScreenController::MenuScreenType &ScreenController::screenType() const
{
    return m_screenType;
}

void ScreenController::setScreenType(const MenuScreenType &newScreenType)
{
    if (m_screenType == newScreenType)
        return;
    m_screenType = newScreenType;
    emit screenTypeChanged();
}

int ScreenController::favRowCount() {
    return 0;
}




