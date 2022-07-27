#ifndef MENUITEM_H
#define MENUITEM_H
#include <QString>

class MenuItem {

public:
    explicit MenuItem(const QString &imageURL, const QString &title, const QString &des,const QString &src);
    ~MenuItem();
    const QString &Description() const;
    bool setDescription(const QString &newDescription);
    const QString &Title() const;
    bool setTitle(const QString &newTitle);
    const QString &ImageURL() const;
    bool setImageURL(const QString &newImageURL);
    const QString &Source() const;
    bool setSource(const QString &newSource);

private:
    QString m_ImageURL, m_Title, m_Description, m_Source;
};

#endif // MENUITEM_H
