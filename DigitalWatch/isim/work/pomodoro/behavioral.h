////////////////////////////////////////////////////////////////////////////////
//   ____  ____   
//  /   /\/   /  
// /___/  \  /   
// \   \   \/  
//  \   \        Copyright (c) 2003-2004 Xilinx, Inc.
//  /   /        All Right Reserved. 
// /---/   /\     
// \   \  /  \  
//  \___\/\___\
////////////////////////////////////////////////////////////////////////////////

#ifndef H_Work_pomodoro_behavioral_H
#define H_Work_pomodoro_behavioral_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_pomodoro_behavioral: public HSim__s6 {
public:

    HSim__s1 SE[11];

  HSimEnumType State;
    HSim__s1 SA[16];
    Work_pomodoro_behavioral(const char * name);
    ~Work_pomodoro_behavioral();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_pomodoro_behavioral(const char *name);

#endif
