#include "menuitem.h"


MenuItem::MenuItem(const QString &imageURL, const QString &title, const QString &des, const QString &src)
{
    m_ImageURL = imageURL;
    m_Title = title;
    m_Description = des;
    m_Source = src;
}

MenuItem::~MenuItem()
{

}

const QString &MenuItem::ImageURL() const
{
    return m_ImageURL;
}

bool MenuItem::setImageURL(const QString &newImageURL)
{
    if(m_ImageURL == newImageURL)
        return false;
    m_ImageURL = newImageURL;
    return true;
}


const QString &MenuItem::Title() const
{
    return m_Title;
}

bool MenuItem::setTitle(const QString &newTitle)
{
    if(m_Title == newTitle)
        return false;
    m_Title = newTitle;
    return true;
}

const QString &MenuItem::Description() const
{
    return m_Description;
}

bool MenuItem::setDescription(const QString &newDescription)
{
    if(m_Description == newDescription)
        return false;
    m_Description = newDescription;
    return true;
}

const QString &MenuItem::Source() const
{
    return m_Source;
}

bool MenuItem::setSource(const QString &newSource)
{
    if(m_Source == newSource)
        return false;
    m_Source = newSource;
    return true;
}
