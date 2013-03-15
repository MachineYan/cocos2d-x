/****************************************************************************
Copyright (c) 2010 cocos2d-x.org

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

#ifndef __CC_IME_DISPATCHER_H__
#define __CC_IME_DISPATCHER_H__

#include "CCIMEDelegate.h"

NS_CC_BEGIN

/**
 * @addtogroup input    输入
 * @{
 */

/**
@brief    Input Method Edit Message Dispatcher. 
*/
// 输入方法编辑调度
class CC_DLL CCIMEDispatcher
{
public:
    ~CCIMEDispatcher();

    /**
    @brief Returns the shared CCIMEDispatcher object for the system.
    */
    // 返回共享实例
    static CCIMEDispatcher* sharedDispatcher();

//     /**
//     @brief Releases all CCIMEDelegates from the shared dispatcher.
//     */
//     static void purgeSharedDispatcher();

    /**
    @brief Dispatches the input text from IME.
    */
    // 调度输入的文本
    void dispatchInsertText(const char * pText, int nLen);

    /**
    @brief Dispatches the delete-backward operation.
    */
    // 调度返回键
    void dispatchDeleteBackward();

    /**
    @brief Get the content text from CCIMEDelegate, retrieved previously from IME.
    */
    // 获取文本
    const char * getContentText();

    //////////////////////////////////////////////////////////////////////////
    // dispatch keyboard notification   调用键盘通知
    //////////////////////////////////////////////////////////////////////////
    void dispatchKeyboardWillShow(CCIMEKeyboardNotificationInfo& info);
    void dispatchKeyboardDidShow(CCIMEKeyboardNotificationInfo& info);
    void dispatchKeyboardWillHide(CCIMEKeyboardNotificationInfo& info);
    void dispatchKeyboardDidHide(CCIMEKeyboardNotificationInfo& info);

protected:
    friend class CCIMEDelegate;

    /**
    @brief Add delegate to receive IME messages.
    */
    // 增加委托，接收键盘消息
    void addDelegate(CCIMEDelegate * pDelegate);

    /**
    @brief Attach the pDelegate to the IME.
    @return If the old delegate can detach from the IME, and the new delegate 
            can attach to the IME, return true, otherwise false.
    */
    // 附加委托
    bool attachDelegateWithIME(CCIMEDelegate * pDelegate);
    bool detachDelegateWithIME(CCIMEDelegate * pDelegate);

    /**
    @brief Remove the delegate from the delegates which receive IME messages.
    */
    // 移除委托
    void removeDelegate(CCIMEDelegate * pDelegate);

private:
    CCIMEDispatcher();
    
    class Impl;
    Impl * m_pImpl;
};

// end of input group
/// @}

NS_CC_END

#endif    // __CC_IME_DISPATCHER_H__
