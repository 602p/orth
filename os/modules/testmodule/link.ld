OUTPUT_FORMAT("binary")

SECTIONS{
  .data 0x0  : {*(.data)}
  .text 0x10 : {*(.text)}
}