#include "menumodel.h"

void DummyData();

MenuModel::MenuModel(QObject *parent) :
    QAbstractListModel{parent}
{
}

MenuModel::~MenuModel()
{
    destroyed();
}

void MenuModel::append(const MenuItem &item)
{
    m_MenuModelList.append(item);
}

int MenuModel::rowCount(const QModelIndex &parent) const
{
    return m_MenuModelList.length();
}

QVariant MenuModel::data(const QModelIndex &index, int role) const
{
    if(!index.isValid())
        return QVariant();

    const MenuItem &item = m_MenuModelList[index.row()];

    switch(role){
    case ImageRole:
        return item.ImageURL();
    case TitleRole:
        return item.Title();
    case DescriptionRole:
        return item.Description();
    case SourceRole:
        return item.Source();
    default:
        return QVariant();
    }
}

bool MenuModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if(!index.isValid())
        return false;

    MenuItem &item = m_MenuModelList[index.row()];

    switch(role){
    case ImageRole:
        return item.setImageURL(value.toString());
    case TitleRole:
        return item.setTitle(value.toString());
    case DescriptionRole:
        return item.setDescription(value.toString());
    default:
        return false;
    }

}

QHash<int, QByteArray> MenuModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[ImageRole] = "imageURL";
    roles[TitleRole] = "menuTitle";
    roles[DescriptionRole] = "menuDes";
    roles[SourceRole] = "src";

    return roles;
}
