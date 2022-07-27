#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQuick>
#include <QQuickWindow>

#include "Controllers/screencontroller.h"
#include "Model/menumodel.h"
#include "Model/menuitem.h"

void generateMenuModel(MenuModel &menuModel);

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    QQuickWindow::setSceneGraphBackend("software");

    //register header line
    qmlRegisterType <ScreenController>  ("Bosch.Prenium.Controller",1,0,"ScreenController");
    qmlRegisterType <MenuModel>         ("Bosch.Prenium.Model",1,0,"MenuModel");

    //generate menu listview model
    MenuModel menuModel;
    generateMenuModel(menuModel);

    QQmlApplicationEngine engine;

    //root context
    QQmlContext *rootContext = engine.rootContext();
    //send property to context
    rootContext->setContextProperty("menuModel",&menuModel);

    const QUrl url(QStringLiteral("qrc:/UI/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

void generateMenuModel(MenuModel &menuModel){
    MenuItem item1("qrc:/UI/assets/type_of_heating.png", "Types of heating" ,"Manual preparation", "qrc:/UI/MenuItemScreen/Menu1.qml");
    MenuItem item2("qrc:/UI/assets/oven.png","Microware","Quick preparation", "qrc:/UI/MenuItemScreen/Menu3.qml");
    MenuItem item3("qrc:/UI/assets/steam.png","Steam","Gentle preparation", "qrc:/UI/MenuItemScreen/Menu3.qml");
    MenuItem item4("qrc:/UI/assets/meal.png","Meals","Assist programes", "qrc:/UI/MenuItemScreen/Menu4.qml");
    MenuItem item5("qrc:/UI/assets/favourite.png","Favorite","My watchlist", "qrc:/UI/MenuItemScreen/Menu5.qml");
    MenuItem item6("qrc:/UI/assets/cleaning.png","Cleaning","Deep cleaning", "qrc:/UI/MenuItemScreen/Menu6.qml");
    MenuItem item7("qrc:/UI/assets/oven.png","Basic Setting","Basic setting", "qrc:/UI/MenuItemScreen/Menu7.qml");
    menuModel.append(item1);
    menuModel.append(item2);
    menuModel.append(item3);
    menuModel.append(item4);
    menuModel.append(item5);
    menuModel.append(item6);
    menuModel.append(item7);
}
