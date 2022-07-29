#ifndef SCREENCONTROLLER_H
#define SCREENCONTROLLER_H

#include <QObject>

class ScreenController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString title READ getTitle WRITE setTitle NOTIFY titleChanged)
    Q_PROPERTY(MenuScreenType screenType READ screenType WRITE setScreenType NOTIFY screenTypeChanged)

public:
    explicit ScreenController(QObject *parent = nullptr);
    ~ScreenController();
    const QString &getTitle() const;
    enum MenuScreenType {
        NONE,
        FAV
    };
    Q_ENUM( MenuScreenType );

    const MenuScreenType &screenType() const;
    void setScreenType(const MenuScreenType &newScreenType);

public slots:
    void setTitle(const QString &newTitle);
    int favRowCount();

signals:
    void titleChanged();
    void screenTypeChanged();

private:
    QString m_title;
    MenuScreenType m_screenType;
    QList<QString> favList;
};

#endif // SCREENCONTROLLER_H
