MEMORY
{
    MEM (rx) : ORIGIN = 0x00000000, LENGTH = 0x4000
    RAM (rw) : ORIGIN = 0x20000000, LENGTH = 0x800
}

SECTIONS
{
    .text :
    {
        *(.vectors*)  /* Include vector table */
        *(.text*)     /* Include all .text sections */
    } > MEM

    .data :
    {
        *(.data*)     /* Include all .data sections */
    } > RAM AT > RAM
}