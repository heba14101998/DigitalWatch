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

#ifndef H_Work_stopwatch_watch_H
#define H_Work_stopwatch_watch_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_stopwatch_watch: public HSim__s6 {
public:

    HSim__s1 SE[10];

  HSimEnumType State;
    HSim__s1 SA[14];
    Work_stopwatch_watch(const char * name);
    ~Work_stopwatch_watch();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_stopwatch_watch(const char *name);

#endif
