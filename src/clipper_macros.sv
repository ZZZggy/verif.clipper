//------------------------------------------------------------------------------
// ACCEDIAN NETWORKS
// High Performance Service Assurance (TM)
//
// Accedian Networks, Inc.
// 2351 Alfred-Nobel Blvd., Suite N-410
// Saint-Laurent (Montreal), Quebec
// H4S 2A9
// Canada
// E-mail: support@accedian.com
// Website: www.accedian.com
//
// ACCEDIAN PROPRIETARY
//
// COPYRIGHT (c) BY ACCEDIAN CORPORATION. ALL RIGHTS RESERVED. NO
// PART OF THIS PROGRAM OR PUBLICATION MAY BE REPRODUCED, TRANSMITTED,
// TRANSCRIBED, STORED IN A RETRIEVAL SYSTEM, OR TRANSLATED INTO ANY LANGUAGE
// OR COMPUTER LANGUAGE IN ANY FORM OR BY ANY MEANS, ELECTRONIC, MECHANICAL,
// MAGNETIC, OPTICAL, CHEMICAL, MANUAL, OR OTHERWISE, WITHOUT THE PRIOR
// WRITTEN PERMISSION OF ACCEDIAN INC.
//-----------------------------------------------------------------------------

`ifndef CLIPPER_MACROS__SV
`define CLIPPER_MACROS__SV

// Macro to reduce boilerplate necessary when selecting the correct register who's name includes the port index.
// Assumes the following register format:
// regmodel.block.reg{PRT}.fld.function();
// Assumes user port indexing 1-8
`define REG_PRT_1G10G(VAR, PRE, PRT, POST0, G10, POST)\
    case (``PRT``)\
        1: ``VAR`` ``PRE``1``POST0````POST``;\
        2: ``VAR`` ``PRE``2``POST0````POST``;\
        3: ``VAR`` ``PRE``3``POST0````POST``;\
        4: ``VAR`` ``PRE``4``POST0````POST``;\
        5: ``VAR`` ``PRE``5``POST0````G10````POST``;\
        6: ``VAR`` ``PRE``6``POST0````G10````POST``;\
        7: ``VAR`` ``PRE``7``POST0````G10````POST``;\
        8: ``VAR`` ``PRE``8``POST0````G10````POST``;\
        9: ``VAR`` ``PRE``9``POST0````POST``;\
       10: ``VAR`` ``PRE``10``POST0````POST``;\
       11: ``VAR`` ``PRE``11``POST0````POST``;\
       12: ``VAR`` ``PRE``12``POST0````POST``;\
        default: begin\
            `uvm_fatal(get_name, $sformatf("Port must be in index range [1:12] (set to %0d)", ``PRT``))\
        end\
    endcase

`define REG_PRT(VAR, PRE, PRT, POST)\
    case (``PRT``)\
        1: ``VAR`` ``PRE``1``POST``;\
        2: ``VAR`` ``PRE``2``POST``;\
        3: ``VAR`` ``PRE``3``POST``;\
        4: ``VAR`` ``PRE``4``POST``;\
        5: ``VAR`` ``PRE``5``POST``;\
        6: ``VAR`` ``PRE``6``POST``;\
        7: ``VAR`` ``PRE``7``POST``;\
        8: ``VAR`` ``PRE``8``POST``;\
        9: ``VAR`` ``PRE``9``POST``;\
       10: ``VAR`` ``PRE``10``POST``;\
       11: ``VAR`` ``PRE``11``POST``;\
       12: ``VAR`` ``PRE``12``POST``;\
        default: begin\
            `uvm_fatal(get_name, $sformatf("Port must be in index range [1:12] (set to %0d)", ``PRT``))\
        end\
    endcase

// Get the upper array bound for a given register based on port
`define REG_PRT_ARRAY_MAX(PRE, PRT, POST)\
    ``PRT`` == 1 ? $size(``PRE``1``POST``)\
    : ``PRT`` == 2  ? $size(``PRE``2``POST``)\
    : ``PRT`` == 3  ? $size(``PRE``3``POST``)\
    : ``PRT`` == 4  ? $size(``PRE``4``POST``)\
    : ``PRT`` == 5  ? $size(``PRE``5``POST``)\
    : ``PRT`` == 6  ? $size(``PRE``6``POST``)\
    : ``PRT`` == 7  ? $size(``PRE``7``POST``)\
    : ``PRT`` == 8  ? $size(``PRE``8``POST``)\
    : ``PRT`` == 9  ? $size(``PRE``9``POST``)\
    : ``PRT`` == 10 ? $size(``PRE``10``POST``)\
    : ``PRT`` == 11 ? $size(``PRE``11``POST``)\
    : $size(``PRE``12``POST``)

`define GET_REG_PRT_ARRAY_SIZE(NAME, PRE, POST)\
    function int get_size_``NAME``(int unsigned _prt);\
        case (_prt)\
            1: return $size(``PRE``1``POST``);\
            2: return $size(``PRE``2``POST``);\
            3: return $size(``PRE``3``POST``);\
            4: return $size(``PRE``4``POST``);\
            5: return $size(``PRE``5``POST``);\
            6: return $size(``PRE``6``POST``);\
            7: return $size(``PRE``7``POST``);\
            8: return $size(``PRE``8``POST``);\
            9: return $size(``PRE``9``POST``);\
           10: return $size(``PRE``10``POST``);\
           11: return $size(``PRE``11``POST``);\
           12: return $size(``PRE``12``POST``);\
            default: return -1;\
        endcase\
    endfunction

`define GET_REG_PRT_ARRAY_SIZE_1(NAME, PRE, POST)\
    function int get_size_``NAME``(int unsigned _prt);\
        case (_prt)\
            5: return $size(``PRE``5``POST``);\
            6: return $size(``PRE``6``POST``);\
            7: return $size(``PRE``7``POST``);\
            8: return $size(``PRE``8``POST``);\
            default: return 1;\
        endcase\
    endfunction

`define GET_REG_PRT_ARRAY_SIZE_1G10G(NAME, PRE, POST, POST1, POST2)\
    function int get_size_``NAME``(int unsigned _prt);\
        case (_prt)\
            1: return $size(``PRE``1``POST````POST2``);\
            2: return $size(``PRE``2``POST````POST2``);\
            3: return $size(``PRE``3``POST````POST2``);\
            4: return $size(``PRE``4``POST````POST2``);\
            5: return $size(``PRE``5``POST````POST1````POST2``);\
            6: return $size(``PRE``6``POST````POST1````POST2``);\
            7: return $size(``PRE``7``POST````POST1````POST2``);\
            8: return $size(``PRE``8``POST````POST1````POST2``);\
            9: return $size(``PRE``9``POST````POST2``);\
           10: return $size(``PRE``10``POST````POST2``);\
           11: return $size(``PRE``11``POST````POST2``);\
           12: return $size(``PRE``12``POST````POST2``);\
            default: return -1;\
        endcase\
    endfunction

// Macro to reduce boilerplate necessary when randomizing registers based on port number.
`define RANDOMIZE_REG_PRT(BLK, POST, PRT, CNSTRNT)\
    case(``PRT``)\
        1: if (!``BLK``1``POST``.randomize() with ``CNSTRNT``) `randerr\
        2: if (!``BLK``2``POST``.randomize() with ``CNSTRNT``) `randerr\
        3: if (!``BLK``3``POST``.randomize() with ``CNSTRNT``) `randerr\
        4: if (!``BLK``4``POST``.randomize() with ``CNSTRNT``) `randerr\
        5: if (!``BLK``5``POST``.randomize() with ``CNSTRNT``) `randerr\
        6: if (!``BLK``6``POST``.randomize() with ``CNSTRNT``) `randerr\
        7: if (!``BLK``7``POST``.randomize() with ``CNSTRNT``) `randerr\
        8: if (!``BLK``8``POST``.randomize() with ``CNSTRNT``) `randerr\
        9: if (!``BLK``9``POST``.randomize() with ``CNSTRNT``) `randerr\
       10: if (!``BLK``10``POST``.randomize() with ``CNSTRNT``) `randerr\
       11: if (!``BLK``11``POST``.randomize() with ``CNSTRNT``) `randerr\
       12: if (!``BLK``12``POST``.randomize() with ``CNSTRNT``) `randerr\
        default: begin\
            `uvm_fatal(get_name, $sformatf("Port must be in index range [1:8] (set to %0d)", ``PRT``))\
        end\
    endcase

`endif
