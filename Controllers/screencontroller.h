#ifndef SCREENCONTROLLER_H
#define SCREENCONTROLLER_H

#include <QObject>

class ScreenController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString title READ getTitle WRITE setTitle NOTIFY titleChanged)

public:
    explicit ScreenController(QObject *parent = nullptr);
    ~ScreenController();
    const QString &getTitle() const;

public slots:
    void setTitle(const QString &newTitle);
    int favRowCount();

signals:
    void titleChanged();

private:
    QString m_title;
    QList<QString> favList;
};

#endif // SCREENCONTROLLER_H
