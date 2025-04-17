# Cache Size Check

To check cache size for a device:
1. Search for chip and core specs/wiki of the device
2. Search for `cache`, `L1`, `L2`, etc.

## Android Example - Redmi Note 8 Pro

1. First search for `Redmi Note 8 Pro wiki/chip`: Mediatek Helio G90T
2. Search for the chip specs [`Mediatek Helio G90T wiki/specs`](https://en.wikipedia.org/wiki/List_of_MediaTek_systems_on_chips):
    - 6x `Arm Cortex-A55`: power-efficient cores
    - 2x `Arm Cortex-A76`: high performance cores
3. Search for `Arm Cortex-A55 wiki` and `Arm Cortex-A76 Wiki`
    - [Arm Cortex-A55 Wiki](https://en.wikipedia.org/wiki/ARM_Cortex-A55)
    - [Arm Cortex-A76 Wiki](https://en.wikipedia.org/wiki/ARM_Cortex-A76)
4. Search for cache info:
    - `L1`: 128 KiB (64 KiB for Instruction Cache and 64 KiB for Data Cache) 
    - `L2`: 128–512 KiB per core
    - `L3`: 512 KiB–4 MiB (optional)

## IOS Example - iPhone 13 pro

1. [iPhone 13 Pro Wiki](https://en.wikipedia.org/wiki/IPhone_13_Pro)
2. [Apple A15 Chip Wiki](https://en.wikipedia.org/wiki/Apple_A15)
    - 4x `Blizzard`: power-efficient cores
    - 2x `Avalanche`: high performance cores
3. [Apple A15 Specs](https://nanoreview.net/en/soc/apple-a15-bionic)
    - L1 cache: 256 KiB (128 KiB for instruction cache & 128 KiB for data cache)
    - L2 cache: 12 MiB

## Windows PC Example

## MacOS Example - Apple M2 
1. [Apple M2 Wiki](https://en.wikipedia.org/wiki/Apple_M2)
2. Search for cache info:
    - L1 cache:
        - Performance cores: 192+128 KB per core
        - Efficiency cores: 128+64 KB per core
    - L2 cache:
        - Performance cores: 16–64 MB
        - Efficiency cores: 4–8 MB
    - L3 cache:
        - M2: 8 MB
        - M2 Pro: 24 MB
        - M2 Max: 48 MB
        - M2 Ultra: 96 MB