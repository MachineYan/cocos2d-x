/****************************************************************************
 Copyright (c) 2013 cocos2d-x.org
 
 http://www.cocos2d-x.org
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 ****************************************************************************/

#import "CCUserDefault.h"
#import <string>
#import "platform/CCPlatformConfig.h"

#if (CC_TARGET_PLATFORM == CC_PLATFORM_IOS) || (CC_TARGET_PLATFORM == CC_PLATFORM_MAC)

NS_CC_BEGIN
using namespace std;

/**
 * implements of CCUserDefault
 */
// 实现用户设置

CCUserDefault* CCUserDefault::m_spUserDefault = 0;
string CCUserDefault::m_sFilePath = string("");
bool CCUserDefault::m_sbIsFilePathInitialized = false;

/**
 * If the user invoke delete CCUserDefault::sharedUserDefault(), should set m_spUserDefault
 * to null to avoid error when he invoke CCUserDefault::sharedUserDefault() later.
 */
// 若果用户调用删除；应设置m_spUserDefault为null;避免错误。
CCUserDefault::~CCUserDefault()
{
	CC_SAFE_DELETE(m_spUserDefault);
    m_spUserDefault = NULL;
}

CCUserDefault::CCUserDefault()
{
	m_spUserDefault = NULL;
}

void CCUserDefault::purgeSharedUserDefault()
{
    m_spUserDefault = NULL;
}

bool CCUserDefault::getBoolForKey(const char* pKey)
{
    return getBoolForKey(pKey, false);
}

bool CCUserDefault::getBoolForKey(const char* pKey, bool defaultValue)
{
    return[[NSUserDefaults standardUserDefaults] boolForKey:[NSString stringWithUTF8String:pKey]];
}

int CCUserDefault::getIntegerForKey(const char* pKey)
{
    return getIntegerForKey(pKey, 0);
}

int CCUserDefault::getIntegerForKey(const char* pKey, int defaultValue)
{
    return [[NSUserDefaults standardUserDefaults] integerForKey: [NSString stringWithUTF8String:pKey]];
}

float CCUserDefault::getFloatForKey(const char* pKey)
{
    return getFloatForKey(pKey, 0);
}

float CCUserDefault::getFloatForKey(const char* pKey, float defaultValue)
{
    return [[NSUserDefaults standardUserDefaults] floatForKey: [NSString stringWithUTF8String:pKey]];
}

double  CCUserDefault::getDoubleForKey(const char* pKey)
{
    return [[NSUserDefaults standardUserDefaults] doubleForKey: [NSString stringWithUTF8String:pKey]];
}

double CCUserDefault::getDoubleForKey(const char* pKey, double defaultValue)
{
	return getDoubleForKey(pKey, 0);
}

std::string CCUserDefault::getStringForKey(const char* pKey)
{
    return getStringForKey(pKey, "");
}

string CCUserDefault::getStringForKey(const char* pKey, const std::string & defaultValue)
{
    NSString *str = [[NSUserDefaults standardUserDefaults] stringForKey:[NSString stringWithUTF8String:pKey]];
    if (! str)
    {
        return defaultValue;
    }
    else
    {
        return [str UTF8String];
    }
}

void CCUserDefault::setBoolForKey(const char* pKey, bool value)
{
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:[NSString stringWithUTF8String:pKey]];
}

void CCUserDefault::setIntegerForKey(const char* pKey, int value)
{
    [[NSUserDefaults standardUserDefaults] setInteger:value forKey:[NSString stringWithUTF8String:pKey]];
}

void CCUserDefault::setFloatForKey(const char* pKey, float value)
{
    [[NSUserDefaults standardUserDefaults] setFloat:value forKey:[NSString stringWithUTF8String:pKey]];
}

void CCUserDefault::setDoubleForKey(const char* pKey, double value)
{
    [[NSUserDefaults standardUserDefaults] setDouble:value forKey:[NSString stringWithUTF8String:pKey]];
}

void CCUserDefault::setStringForKey(const char* pKey, const std::string & value)
{
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithUTF8String:value.c_str()] forKey:[NSString stringWithUTF8String:pKey]];
}

CCUserDefault* CCUserDefault::sharedUserDefault()
{
    if (! m_spUserDefault)
    {
        m_spUserDefault = new CCUserDefault();
    }
    
    return m_spUserDefault;
}

bool CCUserDefault::isXMLFileExist()
{
    return false;
}

void CCUserDefault::initXMLFilePath()
{
    
}

// create new xml file 创建新xml文件
bool CCUserDefault::createXMLFile()
{
	return false;
}

const string& CCUserDefault::getXMLFilePath()
{
    return m_sFilePath;
}

void CCUserDefault::flush()
{
}


NS_CC_END

#endif // (CC_TARGET_PLATFORM == CC_PLATFORM_IOS)
