#include "screencontroller.h"

ScreenController::ScreenController(QObject *parent)
    : QObject{parent}
{
    m_title = "";
}

ScreenController::~ScreenController()
{
    emit destroyed();
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


int ScreenController::favRowCount() {
    return 0;
}




