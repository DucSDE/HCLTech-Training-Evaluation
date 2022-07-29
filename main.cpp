#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQuick>
#include <QQuickWindow>
#include <QQmlPropertyMap>

#include "Controllers/screencontroller.h"
#include "Model/menumodel.h"
#include "Model/menuitem.h"

void generateMenuModel(MenuModel &menuModel);
void generateImageSouce(QQmlPropertyMap &imageSource);
void generateTextControl(QQmlPropertyMap &textControl);

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    QQuickWindow::setSceneGraphBackend("software");

    //register header line
    qmlRegisterType <ScreenController>  ("Bosch.Prenium",1,0,"ScreenController");
    qmlRegisterSingletonType(QUrl("qrc:/UI/SetTitle.qml"),"Bosch.Prenium",1,0,"TitleProvider");

    //generate menu listview model
    MenuModel menuModel;
    generateMenuModel(menuModel);

    //generate image source control
    QQmlPropertyMap imageSource ;
    generateImageSouce(imageSource);

    //generate text control
    QQmlPropertyMap textControl ;
    generateTextControl(textControl);

    QQmlApplicationEngine engine;

    //root context
    QQmlContext *rootContext = engine.rootContext();
    //send property to context
    rootContext->setContextProperty("menuModel",&menuModel);
    rootContext->setContextProperty("imageSource",&imageSource);
    rootContext->setContextProperty("textControl",&textControl);

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

void generateImageSouce(QQmlPropertyMap &imageSource)
{
    imageSource.insert("BackButton","qrc:/UI/assets/back.png");
    imageSource.insert("CloseButton","qrc:/UI/assets/close.png");
    imageSource.insert("MainBackground","qrc:/UI/assets/main_background.png");
    imageSource.insert("Lock","qrc:/UI/assets/lock_white.png");
    imageSource.insert("NoWifi","qrc:/UI/assets/no_wifi_white.png");
    imageSource.insert("Options","qrc:/UI/assets/options.png");

}

void generateTextControl(QQmlPropertyMap &textControl)
{
    textControl.insert("WelcomeTitle","MAIN MENU");
    textControl.insert("WelcomeSubTitle","TEMPING DISHES TO ENJOY");
    textControl.insert("Menu1","Type of heating screen text");
    textControl.insert("Menu2","Microwave screen text");
    textControl.insert("Menu3","Steam screen text");
    textControl.insert("Menu4","Meals screen text");
    textControl.insert("Menu5","Favourite screen text");
    textControl.insert("Menu6","Cleaing screen text");
    textControl.insert("Menu7","Basic setting screen text");
    textControl.insert("favPopupText","You can save your preferred oven settings as favourites by selecting the favourites symbol in the types of heating or dishes. Alternatively, you can also create favourites in the Home Connect app and save these on the appliance.");
}
