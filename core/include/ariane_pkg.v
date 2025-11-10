/* 
    Ariane Package
    ===========================
    Component of the CPU
    Contains all global definitions and parameters used in the Ariane core.

    Copyright (C) 2025
    Author: LibreHardware
    License: MIT
*/

package ariane_pkg;

    // --------------------------------------------------------------------
    // Saturation counter width used in the branch predictor.
    // This determines how many bits are used for each branch history counter.
    // A 2-bit counter can represent four states: strongly taken, weakly taken,
    // weakly not-taken, and strongly not-taken.
    // --------------------------------------------------------------------
    localparam BITS_SATURATION_COUNTER = 2;

    // --------------------------------------------------------------------
    // Depth specification for the store buffer.
    // --------------------------------------------------------------------
    // DEPTH_SPEC defines the number of entries (slots) in the store buffer.
    // It is declared as a 3-bit logic vector and initialized to decimal 4 ('d4).
    // The depth should always be a power of two (e.g., 2, 4, 8, 16...) to simplify
    // address wrapping and buffer indexing in hardware.
    //
    // Example:
    //   DEPTH_SPEC = 4 means the store buffer has 4 entries.
    // --------------------------------------------------------------------
    localparam logic [2:0] DEPTH_SPEC = 'd4;

    // --------------------------------------------------------------------
    // Transprecision float unit
    // --------------------------------------------------------------------
    localparam int unsigned LAT_COMP_FP32 = 'd2;
    localparam int unsigned LAT_COMP_FP64 = 'd3;
    localparam int unsigned LAT_COMP_FP16 = 'd1;
    localparam int unsigned LAT_COMP_FP16ALT = 'd1;
    localparam int unsigned LAT_COMP_FP8 = 'd1;
    localparam int unsigned LAT_DIVSQRT = 'd2;
    localparam int unsigned LAT_NONCOMP = 'd1;
    localparam int unsigned LAT_CONV = 'd2;
    
    // --------------------------------------------------------------------
    // OpenHWGroup parameters
    // --------------------------------------------------------------------
    localparam logic [31:0] OPENHWGROUP_MVENDORID = 32'h0602;
    localparam logic [31:0] ARIANE_MARCHID = 32'd3;
    localparam logic [31:0] ARIANE_MIMPID = 32'd0;

    // --------------------------------------------------------------------
    // 32 Registers
    // --------------------------------------------------------------------
    localparam REG_ADDR_SIZE = 5;

    // --------------------------------------------------------------------
    // Read ports for general purpose register files 
    // --------------------------------------------------------------------
    // @NOTE: Was originally 'localparam NR_RGPR_PORTS = 2;'
    localparam int unsigned NR_RGPR_PORTS = 2;

    // --------------------------------------------------------------------
    // Static debug hartinfo
    // --------------------------------------------------------------------
    // @ Debug Causes
    localparam logic [2:0] CauseBreakpoint = 3'h1;
    localparam logic [2:0] CauseTrigger = 3'h2;
    localparam logic [2:0] CauseRequest = 3'h3;
    localparam logic [2:0] CauseSingleStep = 3'h4;
    // @ Amount of data count registers
    localparam logic [3:0] DataCount = 4'h2;


endpackage
