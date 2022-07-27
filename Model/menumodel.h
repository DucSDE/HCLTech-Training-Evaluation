#ifndef MENUMODEL_H
#define MENUMODEL_H

#include <QObject>
#include <QAbstractListModel>

#include "menuitem.h"

class MenuModel : public QAbstractListModel
{
    Q_OBJECT
public:
    MenuModel(QObject *parent = nullptr);
    ~MenuModel();
    void append(const MenuItem &item);
    enum MenuModelRoles {
        ImageRole  = Qt::UserRole + 1,
        TitleRole,
        DescriptionRole,
        SourceRole
    };

private:
    QList<MenuItem> m_MenuModelList;

    // QAbstractItemModel interface
public:
    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role) override;
protected:
    QHash<int, QByteArray> roleNames() const override;
};

#endif // MENUMODEL_H
