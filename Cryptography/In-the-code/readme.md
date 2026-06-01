# In The Code
**Year of Creation:** 2026
**Author(s):** Connor Gallagher (ConSilverstone)
**Challenge Name:** in-the-code
**Category:** Cryptography
**Difficulty:** Medium-Hard

## Description:   
Intercepted communications produced the following text, an image so large it defies traditional forensic techniques. Question is, can you move like Neo?
  
<details>
<summary>Hint 1:</summary>  
Bunch of wierd characters, maybe a common encoding language?  
</details>
<details>
<summary>Hint 2:</summary>
Far too large, there must be a more efficient way to retrieve the image.
</details>
  
<details>
<summary>Solution & Flag</summary>
Massive hexadecimal text file, most websites will stall when trying to take it. Best method for decrypting is to write a program in your prefered language to take the text file as input and change each hexadecimal to bytes. Then load the image from bytes.  
Flag: LTDH26{1N_TH3_SYST3M}
</details>