# Assembly code examples

Here are some sample codes I created in the phase of learning (re-learning) Assembly rpogramming.

you can find some useful links:

[Nasm Official Website](https://www.nasm.us/)

[netwide assembler github](https://github.com/netwide-assembler)

[Nasm github](https://github.com/netwide-assembler/nasm)

[Masm official website](https://www.masm32.com/)

[64-Bit NASM Assembly Code Examples](https://github.com/Sakib2263/64-Bit-NASM-Assembly-Code-Examples/)

[64bit-assembly github topics](https://github.com/topics/64bit-assembly)

[x86-64- assembly language reference](https://cs.brown.edu/courses/csci1260/spring-2021/lectures/x86-64-assembly-language-reference.html)

[The Art of 64-bit Assembly Language](https://artofasm.randallhyde.com/)

[Assembly Language for x86 Processors book](http://www.asmirvine.com/)

[tutorialspoint course](https://www.tutorialspoint.com/assembly_programming/index.htm)

[jdoodle Online Compiler](https://www.jdoodle.com/compile-assembler-nasm-online/)

[tutorialspoint Online Compiler](https://www.tutorialspoint.com/compile_assembly_online.php)


## Requirements

To run this code you need [Nasm releases](https://www.nasm.us/pub/nasm/releasebuilds/).
The latest stable build (as of 2023) is available here: https://www.nasm.us/pub/nasm/releasebuilds/2.16/
for linux it can be installed using: `sudo apt-get install nasm`
## Code

Code examples can be executed via:

### Linux
#### Assemble code
Use the following command line to assemble your source file:

`nasm -f elf <file-name>.asm`

or

`nasm -f elf64 <file-name>.asm`

In the example, the saved .asm file is called <file-name>.asm. This will create a file named <file-name>.o in the current directory.
N.B. This file is not executable. It is still an object file.

#### Creating the executable
Now that we have our object file, named <file-name>.o, we must create our executable. 
Your program may begin with a procedure called `_start`. 
This means that your program has its own point of entry, without the use of the main function. 
However, you'll need to use the "l" to create your executable:

`ld <file-name>.o -o <file-name>`

Alternatively, your program may begin with a procedure called main. You will need to use gcc to create your executable:

`gcc <file-name>.o -o <file-name>`

#### Program execution
Now, your executable is created, tested, and located in the current directory.
To run the program called test, just type this command:

`./<file-name>`


### Windows
#### Assemble code
Use the following command line to assemble your source file:

`nasm -f win32 <file-name>.asm -o <file-name>.o`

or

`nasm -f win64 <file-name>.asm -o <file-name>.o`

You have now created an object file. The next step will be to turn it into an executable file.

#### Creation and execution of the program
From your Command window, type the final command to create the executable:
`ld <file-name>.o -o <file-name>.exe`


## Data sizes
- Word: a 2-byte data item
- Doubleword: a 4-byte (32 bit) data item
- Quadword: an 8-byte (64 bit) data item
- Paragraph: a 16-byte (128 bit) area
- Kilobyte: 1024 bytes
- Megabyte: 1,048,576 bytes

## Binary Number System
Every number system uses positional notation, i.e., each position in which a digit is written has a different positional value. Each position is power of the base, which is 2 for binary number system, and these powers begin at 0 and increase by 1.

The following table shows the positional values for an 8-bit binary number, where all bits are set ON.

| Bit value 	                          |  1  |  1 | 1  | 1  | 1 | 1 | 1 | 1 |
|:-------------------------------------|:---:|---:|:---|:--:|--:|:--|:-:|--:|
| Position value as a power of base 2	 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |
| Bit number	                          |  7  |  6 | 5  | 4  | 3 | 2 | 1 | 0 |

The value of a binary number is based on the presence of 1 bits and their positional value. So, the value of a given binary number is −

`1 + 2 + 4 + 8 +16 + 32 + 64 + 128 = 255`

which is same as 2^8 - 1.

## Hexadecimal Number System
Hexadecimal number system uses base 16. The digits in this system range from 0 to 15. By convention, the letters A through F is used to represent the hexadecimal digits corresponding to decimal values 10 through 15.

Hexadecimal numbers in computing is used for abbreviating lengthy binary representations. Basically, hexadecimal number system represents a binary data by dividing each byte in half and expressing the value of each half-byte. The following table provides the decimal, binary, and hexadecimal equivalents


| Decimal number | Binary representation | Hexadecimal representation |
|:---------------|:---------------------:|---------------------------:|
| 1              |         0001          |                          1 |
| 2              |         0010          |                          2 |
| 3              |         0011          |                          3 |
| 4              |         0100          |                          4 |
| 5              |         0101          |                          5 |
| 6              |         0110          |                          6 |
| 7              |         0111          |                          7 |
| 8              |         1000          |                          8 |
| 9              |         1001          |                          9 |
| 10             |         1010          |                          A |
| 11             |         1011          |                          B |
| 12             |         1100          |                          C |
| 13             |         1101          |                          D |
| 14             |         1110          |                          E |
| 15             |         1111          |                          F |


## Binary Arithmetic
Binary addition is much easier than the decimal addition when you remember the following tricks or rules. Using these rules, any binary number can be easily added. The four rules of binary addition are:

- 0 + 0 = 0
- 0 + 1 = 1
- 1 + 0 = 1
- 1 + 1 =10

A negative binary value is expressed in two's complement notation. According to this rule, to convert a binary number to its negative value is to reverse its bit values and add 1.

`Number 53 ---------> 00110101` <br>
`Reverse the bits --> 11001010` <br>
`Add 1 -------------> 00000001` <br>
`Number -53 --------> 11001011` <br>

Subtract 42 from 53

`Number 53 ---------------> 00110101` <br>
`Number 42 ---------------> 00101010` <br>
`Reverse the bits of 42 --> 11010101` <br>
`Add 1 -------------------> 00000001` <br>
`Number -42 --------------> 11010110` <br>
`53 - 42 = 11 ------------> 00001011` <br>

Overflow of the last 1 bit is lost.

## Addressing Data in Memory
The process through which the processor controls the execution of instructions is referred as the fetch-decode-execute cycle or the execution cycle. It consists of three continuous steps −

- Fetching the instruction from memory
- Decoding or identifying the instruction
- Executing the instruction

## Basic Syntax
