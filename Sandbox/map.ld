MEMORY
{
    MEM (rx) : ORIGIN = 0x00000000, LENGTH = 0x4000
}

SECTIONS
{
    .text :
    {
        *(.vectors*)  /* Include vector table */
        *(.text*)     /* Include all .text sections */
    } > MEM
}