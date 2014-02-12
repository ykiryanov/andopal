/*
//
//              INTEL CORPORATION PROPRIETARY INFORMATION
//  This software is supplied under the terms of a license  agreement or
//  nondisclosure agreement with Intel Corporation and may not be copied
//  or disclosed except in  accordance  with the terms of that agreement.
//        Copyright (c) 2003-2010 Intel Corporation. All Rights Reserved.
//
//
*/
#include "umc_defs.h"
#if defined (UMC_ENABLE_H264_VIDEO_DECODER)

#ifndef __UMC_H264_NOTIFY_H
#define __UMC_H264_NOTIFY_H

namespace UMC
{

class notifier_base
{
public:
    notifier_base()
        : next_(0)
    {
    }

    virtual ~notifier_base()
    {}

    virtual void Notify() = 0;
    notifier_base * next_;
};

template <typename Object>
class notifier0 : public notifier_base
{
public:
    typedef void (Object::*Function)();

    notifier0(Object* object, Function function)
        : object_(object)
        , function_(function)
    {
    }

    virtual void Notify()
    {
        (object_->*function_)();
    }

private:
    Object* object_;
    Function function_;
};

template <typename Object, typename Param1>
class notifier1 : public notifier_base
{
public:
    typedef void (Object::*Function)(Param1 param1);

    notifier1(Object* object, Function function, Param1 param1)
        : object_(object)
        , function_(function)
        , param1_(param1)
    {
    }

    virtual void Notify()
    {
        (object_->*function_)(param1_);
    }

private:
    Object* object_;
    Function function_;
    Param1 param1_;
};

template <typename Object, typename Param1, typename Param2>
class notifier2 : public notifier_base
{
public:
    typedef void (Object::*Function)(Param1 param1, Param2 param2);

    notifier2(Object* object, Function function, Param1 param1, Param2 param2)
        : object_(object)
        , function_(function)
        , param1_(param1)
        , param2_(param2)
    {
    }

    virtual void Notify()
    {
        (object_->*function_)(param1_, param2_);
    }

private:
    Object* object_;
    Function function_;
    Param1 param1_;
    Param2 param2_;
};

class NotifiersChain : public notifier_base
{
public:
    NotifiersChain()
        : head_(0)
        , tail_(0)
    {
    }

    void Reset()
    {
        notifier_base * tmp = head_;
        while (tmp)
        {
            notifier_base *tmp1 = tmp;
            tmp = tmp->next_;
            delete tmp1;
        }

        head_ = 0;
        tail_ = 0;
    }

    void Abort()
    {
        head_ = 0;
        tail_ = 0;
    }

    virtual ~NotifiersChain()
    {
        Reset();
    }

    bool IsEmpty() const
    {
        return head_ == 0;
    }

    void AddNotifier(notifier_base * nt)
    {
        if (!tail_)
        {
            head_ = tail_ = nt;
            head_->next_ = 0;
            tail_->next_ = 0;
        }
        else
        {
            tail_->next_ = nt;
            nt->next_ = 0;
            tail_ = nt;
        }
    }

    virtual void Notify()
    {
        notifier_base * tmp = head_;
        while (tmp)
        {
            notifier_base *tmp1 = tmp;
            tmp = tmp->next_;
            tmp1->Notify();
            delete tmp1;
        }

        head_ = tail_ = 0;
    }

private:
    notifier_base * head_;
    notifier_base * tail_;
};

} // namespace UMC

#endif // __UMC_H264_NOTIFY_H
#endif // UMC_ENABLE_H264_VIDEO_DECODER
