CONFIG_ARM := y
CONFIG_ARM_32 := y
CONFIG_ARM_$(XEN_OS) := y

# -march= -mcpu=

# Explicitly specifiy 32-bit ARM ISA since toolchain default can be -mthumb:
CFLAGS += -marm

HAS_PL011 := y

# Use only if calling $(LD) directly.
#LDFLAGS_DIRECT_OpenBSD = _obsd
#LDFLAGS_DIRECT_FreeBSD = _fbsd
LDFLAGS_DIRECT_Linux = _linux
LDFLAGS_DIRECT += -marmelf$(LDFLAGS_DIRECT_$(XEN_OS))_eabi

CONFIG_LOAD_ADDRESS ?= 0x80000000

# XXX: When running on the model there is no bootloader to provide a
# device tree.  It must be linked into Xen.
ifndef CONFIG_DTB_FILE
$(error CONFIG_DTB_FILE must be set to the absolute filename of a DTB)
endif
