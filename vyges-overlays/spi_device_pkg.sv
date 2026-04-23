// spi_device_pkg_stub.sv — Minimal stub for passthrough types used by spi_host.sv
// Only passthrough_req_t and passthrough_rsp_t are needed; full spi_device_pkg
// pulls in spi_device_reg_pkg and dozens of unneeded types.
package spi_device_pkg;

  typedef struct packed {
    logic       passthrough_en;
    logic       sck;
    logic       sck_en;
    logic       csb;
    logic       csb_en;
    logic [3:0] s;
    logic [3:0] s_en;
  } passthrough_req_t;

  typedef struct packed {
    logic [3:0] s;
  } passthrough_rsp_t;

  parameter passthrough_req_t PASSTHROUGH_REQ_DEFAULT = '{
    passthrough_en: 1'b0,
    sck:            1'b0,
    sck_en:         1'b0,
    csb:            1'b1,
    csb_en:         1'b0,
    s:              4'h0,
    s_en:           4'h0
  };

  parameter passthrough_rsp_t PASSTHROUGH_RSP_DEFAULT = '{
    s: 4'h0
  };

endpackage
