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

#ifndef H_Work_comparator_comparator_arc_H
#define H_Work_comparator_comparator_arc_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_comparator_comparator_arc: public HSim__s6 {
public:

    HSim__s1 SE[9];

  char t48;
  char t49;
  char t50;
  char t51;
  char t52;
  char t53;
  char t54;
    Work_comparator_comparator_arc(const char * name);
    ~Work_comparator_comparator_arc();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_comparator_comparator_arc(const char *name);

#endif
