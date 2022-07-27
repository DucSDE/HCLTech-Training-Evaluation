#include "menumodel.h"

void DummyData();

MenuModel::MenuModel(QObject *parent) :
    QAbstractListModel{parent}
{
    DummyData();
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

void DummyData(){
    MenuItem item1("qrc:/UI/assets/type_of_heating.png", "Types of heating" ,"Manual preparation", "qrc:/UI/MenuItemScreen/Menu1.qml");
    MenuItem item2("qrc:/UI/assets/oven.png","Microware","Quick preparation", "qrc:/UI/MenuItemScreen/Menu3.qml");
    MenuItem item3("qrc:/UI/assets/steam.png","Steam","Gentle preparation", "qrc:/UI/MenuItemScreen/Menu3.qml");
    MenuItem item4("qrc:/UI/assets/meal.png","Meals","Assist programes", "qrc:/UI/MenuItemScreen/Menu4.qml");
    MenuItem item5("qrc:/UI/assets/favourite.png","Favorite","My watchlist", "qrc:/UI/MenuItemScreen/Menu5.qml");
    MenuItem item6("qrc:/UI/assets/cleaning.png","Cleaning","Deep cleaning", "qrc:/UI/MenuItemScreen/Menu6.qml");
    MenuItem item7("qrc:/UI/assets/oven.png","Basic Setting","Basic setting", "qrc:/UI/MenuItemScreen/Menu7.qml");
//    m_MenuModelList.append(item1);
//    m_MenuModelList.append(item2);
//    m_MenuModelList.append(item3);
//    m_MenuModelList.append(item4);
//    m_MenuModelList.append(item5);
//    m_MenuModelList.append(item6);
//    m_MenuModelList.append(item7);
}
