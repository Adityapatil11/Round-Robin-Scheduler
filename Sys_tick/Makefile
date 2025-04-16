PROJECT = Systick
CPU ?= cortex-m3
BOARD ?= stm32vldiscovery
# BOARD ?= mps2-an385  # Enable when running on Github Codespace

# Build and run with QEMU
qemu:
	arm-none-eabi-as -mthumb -mcpu=$(CPU) -ggdb -c $(PROJECT).S -o $(PROJECT).o
	arm-none-eabi-ld -Tmap.ld $(PROJECT).o -o $(PROJECT).elf
	arm-none-eabi-objdump -D -S $(PROJECT).elf >> $(PROJECT).elf.lst
	arm-none-eabi-readelf -a $(PROJECT).elf > $(PROJECT).elf.debug
	qemu-system-arm -S -M $(BOARD) -cpu $(CPU) -nographic -kernel $(PROJECT).elf -gdb tcp::1234

# Debug with GDB
gdb:
	gdb-multiarch -q $(PROJECT).elf -ex "target remote localhost:1234"

# Clean up generated files
clean:
	rm -rf *.out $(PROJECT).elf .gdb_history *.lst *.debug *.o