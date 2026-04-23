# Vyges overlays — opentitan-spi-host

Same-name overrides that mask upstream files at vendor time.
Declared in `vyges-metadata.json → vyges_overlays[]`.

Upstream-sync policy: pulls proceed normally; any upstream change
to a path listed under `vyges_overlays[].replaces` is flagged for
human review — upstream may have fixed the original issue, making
the overlay obsolete.

## Files

| File | Replaces | Reason |
|---|---|---|
| `spi_host_reg_top.sv` | `rtl/spi_host_reg_top.sv` | Upstream tie-off `assign unused_policy_sel = ^racl_policies_i` uses a struct-level XOR reduction that Vivado 2025.2 rejects as unsupported. Replaced with `assign unused_policy_sel = 1'b0` which RACL-disabled builds accept cleanly. Same-class change to `opentitan-uart/vyges-overlays/uart_reg_top.sv`. |
| `spi_device_pkg.sv` | `rtl/spi_device_pkg.sv` | Minimal stub defining only `passthrough_req_t` and `passthrough_rsp_t` types that `spi_host.sv` references in its port list. The full upstream `spi_device_pkg` pulls in `spi_device_reg_pkg` and dozens of unused types; SoCs that don't host the full spi-device controller don't need any of them. |
