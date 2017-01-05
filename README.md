# ZX Spectrum Experiments
Mucking around with Z80 assembly.

## Setup

1. Install Docker
2. Install Fuse Emulator
    
    **Linux**

    ```
    $ sudo apt-get install fuse-emulator-common spectrum-roms
    ```
    
    **macOS**
    
    ```
    $ brew install homebrew/games/fuse-emulator
    ```

3. Pull bas2tap

    ```
    $ git submodule update --init
    ```

4. Compile bas2tap

    ```
    $ cd bas2tap
    $ make
    ```

## Compiling Source (BASIC & Assembly)

Run either one of these commands:

```
$ make
$ make all
$ make bin/<specific-tape>.tap
```

## Running Tapes

```
$ ./run-tape.sh bin/<specific_tape>.tap
```
