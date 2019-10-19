// g++ INT-int-to-negabinary.cpp -Wall -Wextra, 64-bit CC is required.
// Program that converts decimal signed int into negabinary representation.

#include <climits>
#include <iostream>

void check_int(int decimal)
{
    if(decimal <= INT_MIN || decimal >= INT_MAX)
    {
        std::cout << "Wrong integer size!" << std::endl;
        exit(1);
    }
}

void convert_to_negabinary(int decimal)
{
    unsigned char bit_pos = 0;
    unsigned char bin_sz = sizeof(int) * 8;
    bool negabinary[bin_sz];

    if(decimal >= 0)
    {
        while(true)
        {
            if(decimal % 2 == 0)
            {
                negabinary[bit_pos] = false;
            }
            else
            {
                negabinary[bit_pos] = true;
            }
            decimal = decimal / 2;
            bit_pos++;
            if(bit_pos > bin_sz - 1)
            {
                break;
            }
        }
    }
    else if(decimal == -1) // Case to make the first bit 1 when it's < 0.
    {
        for(bit_pos = 0; bit_pos < bin_sz; bit_pos++)
        {
            negabinary[bit_pos] = true;
        }
    }
    else
    {
        while(true)
        {
            if(-decimal % 2 == 0)
            {
                negabinary[bit_pos] = true;
            }
            else
            {
                negabinary[bit_pos] = false;
            }
            decimal = decimal / 2;
            bit_pos++;
            if(bit_pos > bin_sz - 1)
            {
                break;
            }
        }
    }
    for(bit_pos = bin_sz - 1; bit_pos > 0; bit_pos--) // Printer.
    {
        std::cout << negabinary[bit_pos];
    }
    std::cout << negabinary[0];
}

int main()
{
    int decimal;
    std::cout << "Type decimal: ";
    std::cin >> decimal;
    check_int(decimal);

    std::cout << "Your negabinary [BE]: ";
    convert_to_negabinary(decimal);
    std::cout << std::endl;
}
